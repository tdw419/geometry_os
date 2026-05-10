; DESCRIPTION: Composite: Renders a yellow disk with center (455, 41) and radius 33 then Sets a single yellow pixel at (214, 5).
; PLAN: r0=455(x), r1=41(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=5(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 41
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 5
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
