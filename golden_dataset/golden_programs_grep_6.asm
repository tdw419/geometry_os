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
    LDI r5, 0x000011
    FILL r5

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r0, 10
    STORE r20, r0
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r0, 10
    STORE r20, r0
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r15, 0x6000        ; text pointer
    LDI r7, 0             ; match count
    LDI r3, 1

search_loop:
    ; Read char at text pointer
    LOAD r0, r15
    ; Check for null (end of text)
    LDI r8, 0
    CMP r0, r8
    JZ r11, search_done

    ; Try to match pattern at this position
    LDI r14, 0x6100        ; pattern pointer
    MOV r16, r15            ; save start position

match_try:
    ; Read pattern char
    LOAD r0, r14
    ; If pattern char is null, full match
    LDI r8, 0
    CMP r0, r8
    JZ r11, found_match

    ; Read text char at current position
    LOAD r4, r16
    ; If text is null or newline, no match
    LDI r8, 0
    CMP r4, r8
    JZ r11, no_match

    ; Compare
    CMP r0, r4
    JNZ r11, no_match

    ; Match so far, advance both
    ADD r14, r3
    ADD r16, r3
    JMP match_try

found_match:
    ADDI r7, 1            ; match count++

no_match:
    ADDI r15, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r9, 0x7800
    STORE r9, r7

    ; --- Draw header ---
    LDI r5, 0x006600       ; green header
    LDI r14, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r14, r16, r17, r18, r5

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r15, 4
    LDI r7, 2
    LDI r12, 0x5000
    LDI r1, 0xFFFFFF
    LDI r2, 0x006600
    DRAWTEXT r15, r7, r12, r1, r2

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r15, 4
    LDI r7, 16
    LDI r12, 0x5000
    LDI r1, 0xCCCCCC
    LDI r2, 0x000011
    DRAWTEXT r15, r7, r12, r1, r2

    ; Show the pattern itself
    LDI r15, 80
    LDI r7, 16
    LDI r12, 0x6100
    LDI r1, 0xFFFF00     ; yellow
    LDI r2, 0x000011
    DRAWTEXT r15, r7, r12, r1, r2

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r15, 4
    LDI r7, 32
    LDI r12, 0x5000
    LDI r1, 0xCCCCCC
    LDI r2, 0x000011
    DRAWTEXT r15, r7, r12, r1, r2

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r15, 4
    LDI r7, 48
    LDI r12, 0x5000
    LDI r1, 0xCCCCCC
    LDI r2, 0x000011
    DRAWTEXT r15, r7, r12, r1, r2

    LDI r15, 50
    LDI r7, 48
    LDI r12, 0x6000
    LDI r1, 0x888888
    LDI r2, 0x000011
    DRAWTEXT r15, r7, r12, r1, r2

    HALT
