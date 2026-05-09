; DESCRIPTION: Draws a red rectangle at (388, 46) with width 100 and height 49.
; PLAN: r0=388(x), r1=46(y), r2=100(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 46
LDI r2, 100
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
