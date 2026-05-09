; DESCRIPTION: Composite: Draws a white rectangle at (99, 140) with width 112 and height 34 then Renders a purple line between points (400, 52) and (458, 145) then Places a blue dot at position (86, 149).
; PLAN: r0=99(x), r1=140(y), r2=112(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=52(y1), r7=458(x2), r8=145(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=149(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 140
LDI r2, 112
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 52
LDI r7, 458
LDI r8, 145
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 149
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
