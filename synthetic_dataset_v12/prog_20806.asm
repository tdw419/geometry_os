; DESCRIPTION: Composite: Draws a white rectangle at (210, 59) with width 85 and height 88 then Renders a blue line between points (399, 54) and (337, 97).
; PLAN: r0=210(x), r1=59(y), r2=85(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=54(y1), r7=337(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 59
LDI r2, 85
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 54
LDI r7, 337
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
