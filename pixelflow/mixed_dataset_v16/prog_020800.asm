; DESCRIPTION: Draws a green rectangle at (23, 153) with width 91 and height 78.
; PLAN: r0=23(x), r1=153(y), r2=91(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 153
LDI r2, 91
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
