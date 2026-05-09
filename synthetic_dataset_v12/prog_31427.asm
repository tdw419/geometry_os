; DESCRIPTION: Draws a red rectangle at (85, 144) with width 99 and height 109.
; PLAN: r0=85(x), r1=144(y), r2=99(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 144
LDI r2, 99
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
