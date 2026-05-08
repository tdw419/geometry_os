; DESCRIPTION: This GeOS assembly code counts the number of characters, lines, and words in a predefined text buffer stored at 0x6000. The results are stored in RAM addresses 0x7800, 0x7801, and 0x7802 respectively for characters, lines, and words.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r7, 0x000011
    FILL r7

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r13, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r0, 10             ; newline
    STORE r20, r0
    ADD r20, r13
    STRO r20, "Foo Bar"
    LDI r20, 0x601A        ; 0x600C + 1 + 7 + null = 0x600C+9 = 0x6015... hmm
    ; Let me just build the whole thing at once
    ; Actually STRO writes N chars + null. "Hello World" = 11 chars, writes to 0x6000-0x600A, null at 0x600B
    ; So after STRO, next write should be at 0x600C to overwrite the null with newline

    ; --- Redo: build text properly ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; null at 0x600B, replace with newline
    LDI r20, 0x600B
    LDI r0, 10             ; newline
    STORE r20, r0
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r0, 10
    STORE r20, r0
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r1, 0x6000        ; text pointer
    LDI r5, 0             ; char count
    LDI r6, 0             ; line count
    LDI r12, 0             ; word count
    LDI r15, 1             ; prev_was_space (start true)

count_loop:
    LOAD r0, r1           ; read char
    LDI r2, 0
    CMP r0, r2
    JZ r14, count_done

    ; char count++
    ADDI r5, 1

    ; Is it whitespace?
    LDI r2, 32
    CMP r0, r2
    JZ r14, is_space
    LDI r2, 10
    CMP r0, r2
    JZ r14, is_newline

    ; Non-whitespace: check if new word
    LDI r2, 1
    CMP r15, r2
    JNZ r14, not_new_word  ; if prev was NOT space, not a new word
    ADDI r12, 1            ; word count++
not_new_word:
    LDI r15, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r15, 1
    JMP next_char

is_newline:
    ADDI r6, 1            ; line count++
    LDI r15, 1
    JMP next_char

next_char:
    ADDI r1, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r10, 0x7800
    STORE r10, r5          ; chars

    LDI r10, 0x7801
    STORE r10, r6          ; lines

    LDI r10, 0x7802
    STORE r10, r12          ; words

    ; --- Draw header ---
    LDI r7, 0x660000
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r7

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r1, 4
    LDI r5, 2
    LDI r6, 0x5000
    LDI r12, 0xFFFFFF
    LDI r15, 0x660000
    DRAWTEXT r1, r5, r6, r12, r15

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r1, 4
    LDI r5, 20
    LDI r6, 0x5000
    LDI r12, 0xCCCCCC
    LDI r15, 0x000011
    DRAWTEXT r1, r5, r6, r12, r15

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r1, 4
    LDI r5, 36
    LDI r6, 0x5000
    LDI r12, 0xCCCCCC
    LDI r15, 0x000011
    DRAWTEXT r1, r5, r6, r12, r15

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r1, 4
    LDI r5, 52
    LDI r6, 0x5000
    LDI r12, 0xCCCCCC
    LDI r15, 0x000011
    DRAWTEXT r1, r5, r6, r12, r15

    HALT
