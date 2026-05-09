; DESCRIPTION: Composite: Renders a blue line between points (473, 212) and (506, 122) then Creates a cyan circular shape at (141, 240) with radius 13.
; PLAN: r0=473(x1), r1=212(y1), r2=506(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=240(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 212
LDI r2, 506
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 240
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
