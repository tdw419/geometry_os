; DESCRIPTION: Draws a yellow rectangle at (252, 32) with width 90 and height 60.
; PLAN: r0=252(x), r1=32(y), r2=90(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 32
LDI r2, 90
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
