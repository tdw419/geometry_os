; DESCRIPTION: This GeOS assembly code searches for a byte pattern in a text buffer located at 0x6000, using a pre-loaded pattern at 0x6100. It counts the matches and displays them on the screen with highlighted text, storing the match count at RAM[0x7800].

; grep.asm -- Search for a pattern in RAM text
;
; Searches for all occurrences of a byte pattern in a text buffer.
; Pattern is pre-loaded at 0x6100, text at 0x6000.
; Outputs match count at RAM[0x7800].
; Displays matches on screen with highlighted text.
;
; Sample: search for "oo" in "Hello World\nFoo Bar\nBaz"
; Expected: 1 match (in "F[oo] Bar")

    ; --- Fill screen ---
    LDI r2, 0x000011
    FILL r2

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r3, 10
    STORE r20, r3
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r3, 10
    STORE r20, r3
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r11, 0x6000        ; text pointer
    LDI r6, 0             ; match count
    LDI r8, 1

search_loop:
    ; Read char at text pointer
    LOAD r3, r11
    ; Check for null (end of text)
    LDI r13, 0
    CMP r3, r13
    JZ r14, search_done

    ; Try to match pattern at this position
    LDI r9, 0x6100        ; pattern pointer
    MOV r16, r11            ; save start position

match_try:
    ; Read pattern char
    LOAD r3, r9
    ; If pattern char is null, full match
    LDI r13, 0
    CMP r3, r13
    JZ r14, found_match

    ; Read text char at current position
    LOAD r15, r16
    ; If text is null or newline, no match
    LDI r13, 0
    CMP r15, r13
    JZ r14, no_match

    ; Compare
    CMP r3, r15
    JNZ r14, no_match

    ; Match so far, advance both
    ADD r9, r8
    ADD r16, r8
    JMP match_try

found_match:
    ADDI r6, 1            ; match count++

no_match:
    ADDI r11, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r10, 0x7800
    STORE r10, r6

    ; --- Draw header ---
    LDI r2, 0x006600       ; green header
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r2

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r11, 4
    LDI r6, 2
    LDI r12, 0x5000
    LDI r4, 0xFFFFFF
    LDI r1, 0x006600
    DRAWTEXT r11, r6, r12, r4, r1

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r11, 4
    LDI r6, 16
    LDI r12, 0x5000
    LDI r4, 0xCCCCCC
    LDI r1, 0x000011
    DRAWTEXT r11, r6, r12, r4, r1

    ; Show the pattern itself
    LDI r11, 80
    LDI r6, 16
    LDI r12, 0x6100
    LDI r4, 0xFFFF00     ; yellow
    LDI r1, 0x000011
    DRAWTEXT r11, r6, r12, r4, r1

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r11, 4
    LDI r6, 32
    LDI r12, 0x5000
    LDI r4, 0xCCCCCC
    LDI r1, 0x000011
    DRAWTEXT r11, r6, r12, r4, r1

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r11, 4
    LDI r6, 48
    LDI r12, 0x5000
    LDI r4, 0xCCCCCC
    LDI r1, 0x000011
    DRAWTEXT r11, r6, r12, r4, r1

    LDI r11, 50
    LDI r6, 48
    LDI r12, 0x6000
    LDI r4, 0x888888
    LDI r1, 0x000011
    DRAWTEXT r11, r6, r12, r4, r1

    HALT
