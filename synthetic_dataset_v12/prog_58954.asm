; DESCRIPTION: Draws a black rectangle at (180, 162) with width 13 and height 80.
; PLAN: r0=180(x), r1=162(y), r2=13(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 162
LDI r2, 13
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
