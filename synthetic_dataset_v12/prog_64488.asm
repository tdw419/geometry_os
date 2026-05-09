; DESCRIPTION: Draws a red rectangle at (54, 95) with width 87 and height 26.
; PLAN: r0=54(x), r1=95(y), r2=87(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 95
LDI r2, 87
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
