; DESCRIPTION: Draws a red rectangle at (0, 34) with width 73 and height 80.
; PLAN: r0=0(x), r1=34(y), r2=73(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 34
LDI r2, 73
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
