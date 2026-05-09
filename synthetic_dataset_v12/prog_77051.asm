; DESCRIPTION: Composite: Renders a blue line between points (367, 30) and (329, 54) then Draws a yellow rectangle at (274, 137) with width 54 and height 60.
; PLAN: r0=367(x1), r1=30(y1), r2=329(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=137(y), r7=54(width), r8=60(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 30
LDI r2, 329
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 137
LDI r7, 54
LDI r8, 60
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
