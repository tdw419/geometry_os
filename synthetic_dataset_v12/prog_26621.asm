; DESCRIPTION: Draws a red rectangle at (120, 137) with width 29 and height 54.
; PLAN: r0=120(x), r1=137(y), r2=29(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 137
LDI r2, 29
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
