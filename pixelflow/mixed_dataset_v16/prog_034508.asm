; DESCRIPTION: Draws a purple rectangle at (295, 137) with width 66 and height 108.
; PLAN: r0=295(x), r1=137(y), r2=66(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 137
LDI r2, 66
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
