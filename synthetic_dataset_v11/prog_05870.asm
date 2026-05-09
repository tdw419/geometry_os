; DESCRIPTION: Draws a red rectangle at (37, 45) with width 105 and height 11.
; PLAN: r0=37(x), r1=45(y), r2=105(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 45
LDI r2, 105
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
