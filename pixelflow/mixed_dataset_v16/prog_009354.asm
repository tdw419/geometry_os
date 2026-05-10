; DESCRIPTION: Draws a yellow rectangle at (129, 16) with width 50 and height 91.
; PLAN: r0=129(x), r1=16(y), r2=50(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 16
LDI r2, 50
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
