; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (27, 94) with width 111 and height 67. Then Places a orange dot at position (163, 82).
; PLAN: r0=27(x), r1=94(y), r2=111(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=163(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (27, 94) with width 111 and height 67.
; PLAN: r0=27(x), r1=94(y), r2=111(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 94
LDI r2, 111
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (163, 82).
; PLAN: r0=163(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
