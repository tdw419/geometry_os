; DESCRIPTION: Draws a red rectangle at (100, 66) with width 21 and height 65.
; PLAN: r0=100(x), r1=66(y), r2=21(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 66
LDI r2, 21
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
