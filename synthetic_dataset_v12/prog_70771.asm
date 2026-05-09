; DESCRIPTION: Composite: Renders a yellow line between points (332, 168) and (421, 57) then Sets a single blue pixel at (464, 191).
; PLAN: r0=332(x1), r1=168(y1), r2=421(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=191(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 168
LDI r2, 421
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 191
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
