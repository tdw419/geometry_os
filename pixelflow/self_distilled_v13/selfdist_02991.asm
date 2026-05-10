; DESCRIPTION: Draws a red rectangle at (297, 99) with width 81 and height 31.
; PLAN: r0=297(x), r1=99(y), r2=81(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 99
LDI r2, 81
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
