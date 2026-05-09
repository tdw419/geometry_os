; DESCRIPTION: Composite: Renders a red disk with center (314, 219) and radius 20 then Places a black dot at position (284, 200).
; PLAN: r0=314(x), r1=219(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=200(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 219
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 200
LDI r7, 0x000000
PSET r5, r6, r7
HALT
