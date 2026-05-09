; DESCRIPTION: Composite: Draws a blue line from (269, 105) to (159, 24) then Renders a cyan disk with center (339, 192) and radius 35.
; PLAN: r0=269(x1), r1=105(y1), r2=159(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=192(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 105
LDI r2, 159
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 192
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
