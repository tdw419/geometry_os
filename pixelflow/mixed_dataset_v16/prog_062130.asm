; DESCRIPTION: Composite: Renders a blue disk with center (459, 77) and radius 28 then Places a yellow dot at position (400, 22).
; PLAN: r0=459(x), r1=77(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=22(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 459
LDI r1, 77
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 22
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
