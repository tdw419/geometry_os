; DESCRIPTION: Draws a red rectangle at (264, 52) with width 65 and height 66.
; PLAN: r0=264(x), r1=52(y), r2=65(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 52
LDI r2, 65
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
