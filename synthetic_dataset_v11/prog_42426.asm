; DESCRIPTION: Draws a black rectangle at (13, 186) with width 73 and height 70.
; PLAN: r0=13(x), r1=186(y), r2=73(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 186
LDI r2, 73
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
