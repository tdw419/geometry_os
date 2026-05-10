; DESCRIPTION: Composite: Places a white circle of radius 18 at center (372, 167) then Places a yellow line segment connecting (423, 112) to (62, 196).
; PLAN: r0=372(x), r1=167(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x1), r6=112(y1), r7=62(x2), r8=196(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 167
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 112
LDI r7, 62
LDI r8, 196
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
