; DESCRIPTION: Composite: . Then Renders a purple disk with center (147, 128) and radius 17. Then Places a red dot at position (132, 55).
; PLAN: r0=147(x), r1=128(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (147, 128) and radius 17.
; PLAN: r0=147(x), r1=128(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 128
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (132, 55).
; PLAN: r0=132(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
