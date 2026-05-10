; DESCRIPTION: Draws a black rectangle at (360, 99) with width 80 and height 91.
; PLAN: r0=360(x), r1=99(y), r2=80(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 99
LDI r2, 80
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
