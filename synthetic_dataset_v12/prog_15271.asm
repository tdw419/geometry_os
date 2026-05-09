; DESCRIPTION: Draws a cyan rectangle at (89, 202) with width 78 and height 19.
; PLAN: r0=89(x), r1=202(y), r2=78(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 202
LDI r2, 78
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
