; DESCRIPTION: Draws a cyan rectangle at (319, 5) with width 109 and height 94.
; PLAN: r0=319(x), r1=5(y), r2=109(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 5
LDI r2, 109
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
