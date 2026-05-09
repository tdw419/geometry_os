; DESCRIPTION: Draws a white rectangle at (361, 102) with width 48 and height 65.
; PLAN: r0=361(x), r1=102(y), r2=48(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 102
LDI r2, 48
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
