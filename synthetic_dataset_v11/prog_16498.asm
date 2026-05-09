; DESCRIPTION: Draws a red rectangle at (169, 160) with width 12 and height 52.
; PLAN: r0=169(x), r1=160(y), r2=12(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 160
LDI r2, 12
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
