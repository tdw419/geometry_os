; DESCRIPTION: Geometry OS program to draw a colored object.

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
    LDI r9, 10
    STORE r20, r9
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r9, 10
    STORE r20, r9
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r15, 0x6000        ; text pointer
    LDI r12, 0             ; match count
    LDI r4, 1

search_loop:
    ; Read char at text pointer
    LOAD r9, r15
    ; Check for null (end of text)
    LDI r14, 0
    CMP r9, r14
    JZ r8, search_done

    ; Try to match pattern at this position
    LDI r1, 0x6100        ; pattern pointer
    MOV r16, r15            ; save start position

match_try:
    ; Read pattern char
    LOAD r9, r1
    ; If pattern char is null, full match
    LDI r14, 0
    CMP r9, r14
    JZ r8, found_match

    ; Read text char at current position
    LOAD r0, r16
    ; If text is null or newline, no match
    LDI r14, 0
    CMP r0, r14
    JZ r8, no_match

    ; Compare
    CMP r9, r0
    JNZ r8, no_match

    ; Match so far, advance both
    ADD r1, r4
    ADD r16, r4
    JMP match_try

found_match:
    ADDI r12, 1            ; match count++

no_match:
    ADDI r15, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r3, 0x7800
    STORE r3, r12

    ; --- Draw header ---
    LDI r2, 0x006600       ; green header
    LDI r1, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r2

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r15, 4
    LDI r12, 2
    LDI r5, 0x5000
    LDI r7, 0xFFFFFF
    LDI r13, 0x006600
    DRAWTEXT r15, r12, r5, r7, r13

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r15, 4
    LDI r12, 16
    LDI r5, 0x5000
    LDI r7, 0xCCCCCC
    LDI r13, 0x000011
    DRAWTEXT r15, r12, r5, r7, r13

    ; Show the pattern itself
    LDI r15, 80
    LDI r12, 16
    LDI r5, 0x6100
    LDI r7, 0xFFFF00     ; yellow
    LDI r13, 0x000011
    DRAWTEXT r15, r12, r5, r7, r13

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r15, 4
    LDI r12, 32
    LDI r5, 0x5000
    LDI r7, 0xCCCCCC
    LDI r13, 0x000011
    DRAWTEXT r15, r12, r5, r7, r13

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r15, 4
    LDI r12, 48
    LDI r5, 0x5000
    LDI r7, 0xCCCCCC
    LDI r13, 0x000011
    DRAWTEXT r15, r12, r5, r7, r13

    LDI r15, 50
    LDI r12, 48
    LDI r5, 0x6000
    LDI r7, 0x888888
    LDI r13, 0x000011
    DRAWTEXT r15, r12, r5, r7, r13

    HALT
