; DESCRIPTION: Composite: Renders a yellow line between points (270, 56) and (121, 157) then Sets a single blue pixel at (452, 249).
; PLAN: r0=270(x1), r1=56(y1), r2=121(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=249(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 56
LDI r2, 121
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 249
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
