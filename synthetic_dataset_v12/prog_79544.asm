; DESCRIPTION: Composite: Renders a yellow disk with center (295, 161) and radius 38 then Sets a single blue pixel at (167, 50).
; PLAN: r0=295(x), r1=161(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=50(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 161
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 50
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
