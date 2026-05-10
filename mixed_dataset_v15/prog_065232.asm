; DESCRIPTION: Draws a red rectangle at (19, 200) with width 83 and height 10.
; PLAN: r0=19(x), r1=200(y), r2=83(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 200
LDI r2, 83
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
