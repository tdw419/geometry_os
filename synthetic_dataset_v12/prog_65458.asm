; DESCRIPTION: Draws a red rectangle at (349, 100) with width 33 and height 81.
; PLAN: r0=349(x), r1=100(y), r2=33(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 100
LDI r2, 33
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
