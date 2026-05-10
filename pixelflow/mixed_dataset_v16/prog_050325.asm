; DESCRIPTION: Composite: Renders a blue disk with center (88, 129) and radius 64 then Places a white dot at position (459, 192).
; PLAN: r0=88(x), r1=129(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x), r6=192(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 129
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 192
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
