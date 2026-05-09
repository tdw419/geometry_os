; DESCRIPTION: Draws a red rectangle at (101, 176) with width 73 and height 54.
; PLAN: r0=101(x), r1=176(y), r2=73(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 176
LDI r2, 73
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
