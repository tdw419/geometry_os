; DESCRIPTION: Composite: Renders a yellow disk with center (137, 129) and radius 33 then Places a red line segment connecting (494, 144) to (1, 81).
; PLAN: r0=137(x), r1=129(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=144(y1), r7=1(x2), r8=81(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 129
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 144
LDI r7, 1
LDI r8, 81
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
