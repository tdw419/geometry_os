; DESCRIPTION: Draws a black rectangle at (263, 99) with width 91 and height 70.
; PLAN: r0=263(x), r1=99(y), r2=91(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 99
LDI r2, 91
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
