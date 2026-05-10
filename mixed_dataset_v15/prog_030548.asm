; DESCRIPTION: Draws a red rectangle at (53, 99) with width 12 and height 33.
; PLAN: r0=53(x), r1=99(y), r2=12(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 99
LDI r2, 12
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
