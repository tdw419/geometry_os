; DESCRIPTION: Draws a black rectangle at (110, 13) with width 23 and height 48.
; PLAN: r0=110(x), r1=13(y), r2=23(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 13
LDI r2, 23
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
