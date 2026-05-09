; DESCRIPTION: Draws a red rectangle at (90, 73) with width 110 and height 83.
; PLAN: r0=90(x), r1=73(y), r2=110(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 73
LDI r2, 110
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
