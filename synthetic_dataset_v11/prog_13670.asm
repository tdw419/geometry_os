; DESCRIPTION: Composite: . Then Places a orange dot at position (49, 7). Then Draws a black rectangle at (116, 144) with width 65 and height 33.
; PLAN: r0=49(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=116(x), r1=144(y), r2=65(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (49, 7).
; PLAN: r0=49(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (116, 144) with width 65 and height 33.
; PLAN: r0=116(x), r1=144(y), r2=65(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 144
LDI r2, 65
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
