; DESCRIPTION: Draws a yellow rectangle at (129, 32) with width 85 and height 95.
; PLAN: r0=129(x), r1=32(y), r2=85(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 32
LDI r2, 85
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
