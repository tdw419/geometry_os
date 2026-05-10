; DESCRIPTION: Draws a red rectangle at (345, 80) with width 100 and height 114.
; PLAN: r0=345(x), r1=80(y), r2=100(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 80
LDI r2, 100
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
