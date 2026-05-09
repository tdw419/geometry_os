; DESCRIPTION: Draws a cyan rectangle at (185, 88) with width 70 and height 97.
; PLAN: r0=185(x), r1=88(y), r2=70(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 88
LDI r2, 70
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
