; DESCRIPTION: Composite: Creates a blue circular shape at (149, 119) with radius 32 then Renders a purple line between points (209, 193) and (131, 194).
; PLAN: r0=149(x), r1=119(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=193(y1), r7=131(x2), r8=194(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 119
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 193
LDI r7, 131
LDI r8, 194
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
