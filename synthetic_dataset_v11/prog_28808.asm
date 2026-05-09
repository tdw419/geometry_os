; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (109, 73) with width 62 and height 85. Then Places a black dot at position (155, 240).
; PLAN: r0=109(x), r1=73(y), r2=62(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (109, 73) with width 62 and height 85.
; PLAN: r0=109(x), r1=73(y), r2=62(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 73
LDI r2, 62
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (155, 240).
; PLAN: r0=155(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
HALT
