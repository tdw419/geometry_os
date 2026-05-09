; DESCRIPTION: Draws a red rectangle at (36, 144) with width 29 and height 68.
; PLAN: r0=36(x), r1=144(y), r2=29(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 144
LDI r2, 29
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
