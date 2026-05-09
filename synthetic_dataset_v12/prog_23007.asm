; DESCRIPTION: Composite: Draws a blue line from (226, 136) to (185, 186) then Renders a orange disk with center (190, 177) and radius 35.
; PLAN: r0=226(x1), r1=136(y1), r2=185(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=177(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 136
LDI r2, 185
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 177
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
