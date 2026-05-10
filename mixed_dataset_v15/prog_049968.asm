; DESCRIPTION: Draws a cyan rectangle at (378, 117) with width 18 and height 64.
; PLAN: r0=378(x), r1=117(y), r2=18(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 117
LDI r2, 18
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
