; DESCRIPTION: Draws a red rectangle at (80, 97) with width 53 and height 77.
; PLAN: r0=80(x), r1=97(y), r2=53(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 97
LDI r2, 53
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
