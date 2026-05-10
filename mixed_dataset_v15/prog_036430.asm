; DESCRIPTION: Composite: Places a yellow circle of radius 17 at center (158, 79) then Places a purple dot at position (68, 214).
; PLAN: r0=158(x), r1=79(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=214(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 79
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 214
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
