; DESCRIPTION: Draws a white rectangle at (345, 36) with width 115 and height 102.
; PLAN: r0=345(x), r1=36(y), r2=115(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 36
LDI r2, 115
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
