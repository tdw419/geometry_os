; DESCRIPTION: Draws a cyan rectangle at (22, 40) with width 40 and height 94.
; PLAN: r0=22(x), r1=40(y), r2=40(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 40
LDI r2, 40
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
