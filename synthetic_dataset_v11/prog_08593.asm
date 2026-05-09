; DESCRIPTION: Composite: . Then Places a black dot at position (31, 236). Then Draws a purple rectangle at (41, 64) with width 59 and height 98.
; PLAN: r0=31(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=41(x), r1=64(y), r2=59(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (31, 236).
; PLAN: r0=31(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a purple rectangle at (41, 64) with width 59 and height 98.
; PLAN: r0=41(x), r1=64(y), r2=59(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 64
LDI r2, 59
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
