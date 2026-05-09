; DESCRIPTION: Draws a red rectangle at (221, 43) with width 115 and height 30.
; PLAN: r0=221(x), r1=43(y), r2=115(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 43
LDI r2, 115
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
