; DESCRIPTION: Draws a red rectangle at (229, 20) with width 90 and height 23.
; PLAN: r0=229(x), r1=20(y), r2=90(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 20
LDI r2, 90
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
