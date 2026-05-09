; DESCRIPTION: Composite: Places a cyan line segment connecting (238, 43) to (330, 164) then Creates a purple circular shape at (129, 95) with radius 26.
; PLAN: r0=238(x1), r1=43(y1), r2=330(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=95(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 238
LDI r1, 43
LDI r2, 330
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 95
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
