; DESCRIPTION: Draws a red rectangle at (23, 99) with width 20 and height 73.
; PLAN: r0=23(x), r1=99(y), r2=20(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 99
LDI r2, 20
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
