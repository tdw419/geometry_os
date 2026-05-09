; DESCRIPTION: Draws a red rectangle at (16, 169) with width 36 and height 81.
; PLAN: r0=16(x), r1=169(y), r2=36(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 169
LDI r2, 36
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
