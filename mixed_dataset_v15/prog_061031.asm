; DESCRIPTION: Draws a red rectangle at (57, 30) with width 100 and height 83.
; PLAN: r0=57(x), r1=30(y), r2=100(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 100
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
