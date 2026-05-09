; DESCRIPTION: Composite: Renders a green disk with center (254, 184) and radius 68 then Places a purple dot at position (59, 58).
; PLAN: r0=254(x), r1=184(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=58(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 184
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 58
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
