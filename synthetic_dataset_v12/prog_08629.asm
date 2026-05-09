; DESCRIPTION: Draws a cyan rectangle at (132, 22) with width 79 and height 15.
; PLAN: r0=132(x), r1=22(y), r2=79(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 22
LDI r2, 79
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
