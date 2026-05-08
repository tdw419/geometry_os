; DESCRIPTION: A red line centered at the screen with fixed size.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r5, 0x000011
    FILL r5

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r1, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r4, 10             ; newline
    STORE r20, r4
    ADD r20, r1
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
    LDI r4, 10             ; newline
    STORE r20, r4
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r4, 10
    STORE r20, r4
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r6, 0x6000        ; text pointer
    LDI r15, 0             ; char count
    LDI r7, 0             ; line count
    LDI r0, 0             ; word count
    LDI r14, 1             ; prev_was_space (start true)

count_loop:
    LOAD r4, r6           ; read char
    LDI r10, 0
    CMP r4, r10
    JZ r2, count_done

    ; char count++
    ADDI r15, 1

    ; Is it whitespace?
    LDI r10, 32
    CMP r4, r10
    JZ r2, is_space
    LDI r10, 10
    CMP r4, r10
    JZ r2, is_newline

    ; Non-whitespace: check if new word
    LDI r10, 1
    CMP r14, r10
    JNZ r2, not_new_word  ; if prev was NOT space, not a new word
    ADDI r0, 1            ; word count++
not_new_word:
    LDI r14, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r14, 1
    JMP next_char

is_newline:
    ADDI r7, 1            ; line count++
    LDI r14, 1
    JMP next_char

next_char:
    ADDI r6, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r13, 0x7800
    STORE r13, r15          ; chars

    LDI r13, 0x7801
    STORE r13, r7          ; lines

    LDI r13, 0x7802
    STORE r13, r0          ; words

    ; --- Draw header ---
    LDI r5, 0x660000
    LDI r3, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r3, r16, r17, r18, r5

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r6, 4
    LDI r15, 2
    LDI r7, 0x5000
    LDI r0, 0xFFFFFF
    LDI r14, 0x660000
    DRAWTEXT r6, r15, r7, r0, r14

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r6, 4
    LDI r15, 20
    LDI r7, 0x5000
    LDI r0, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r6, r15, r7, r0, r14

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r6, 4
    LDI r15, 36
    LDI r7, 0x5000
    LDI r0, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r6, r15, r7, r0, r14

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r6, 4
    LDI r15, 52
    LDI r7, 0x5000
    LDI r0, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r6, r15, r7, r0, r14

    HALT
