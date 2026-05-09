; DESCRIPTION: Draws a red rectangle at (134, 65) with width 56 and height 52.
; PLAN: r0=134(x), r1=65(y), r2=56(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 65
LDI r2, 56
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
