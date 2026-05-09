; DESCRIPTION: Draws a red rectangle at (369, 50) with width 90 and height 110.
; PLAN: r0=369(x), r1=50(y), r2=90(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 50
LDI r2, 90
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
