; DESCRIPTION: Draws a red rectangle at (402, 212) with width 77 and height 26.
; PLAN: r0=402(x), r1=212(y), r2=77(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 212
LDI r2, 77
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
