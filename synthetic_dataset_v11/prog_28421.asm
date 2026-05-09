; DESCRIPTION: Draws a red rectangle at (60, 170) with width 85 and height 56.
; PLAN: r0=60(x), r1=170(y), r2=85(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 170
LDI r2, 85
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
