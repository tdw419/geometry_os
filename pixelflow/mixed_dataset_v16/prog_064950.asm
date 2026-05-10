; DESCRIPTION: Draws a yellow rectangle at (27, 50) with width 91 and height 22.
; PLAN: r0=27(x), r1=50(y), r2=91(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 50
LDI r2, 91
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
