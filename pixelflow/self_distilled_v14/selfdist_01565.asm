; DESCRIPTION: Draws a orange rectangle at (323, 68) with width 94 and height 36.
; PLAN: r0=323(x), r1=68(y), r2=94(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 68
LDI r2, 94
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
