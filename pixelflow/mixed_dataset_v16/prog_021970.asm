; DESCRIPTION: Draws a yellow rectangle at (244, 91) with width 48 and height 36.
; PLAN: r0=244(x), r1=91(y), r2=48(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 91
LDI r2, 48
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
