; DESCRIPTION: Draws a red rectangle at (369, 139) with width 80 and height 44.
; PLAN: r0=369(x), r1=139(y), r2=80(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 139
LDI r2, 80
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
