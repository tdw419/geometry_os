; DESCRIPTION: Draws a yellow rectangle at (152, 6) with width 72 and height 52.
; PLAN: r0=152(x), r1=6(y), r2=72(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 6
LDI r2, 72
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
