; DESCRIPTION: Draws a green rectangle at (152, 24) with width 101 and height 120.
; PLAN: r0=152(x), r1=24(y), r2=101(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 24
LDI r2, 101
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
