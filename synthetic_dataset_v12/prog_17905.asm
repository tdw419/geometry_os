; DESCRIPTION: Composite: Renders a blue line between points (402, 188) and (415, 95) then Draws a red rectangle at (334, 77) with width 90 and height 20.
; PLAN: r0=402(x1), r1=188(y1), r2=415(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=77(y), r7=90(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 188
LDI r2, 415
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 77
LDI r7, 90
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
