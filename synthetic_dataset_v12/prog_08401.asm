; DESCRIPTION: Draws a red rectangle at (200, 3) with width 44 and height 102.
; PLAN: r0=200(x), r1=3(y), r2=44(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 3
LDI r2, 44
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
