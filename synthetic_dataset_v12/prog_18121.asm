; DESCRIPTION: Composite: Places a yellow circle of radius 62 at center (380, 94) then Sets a single magenta pixel at (370, 208).
; PLAN: r0=380(x), r1=94(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=208(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 94
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 208
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
