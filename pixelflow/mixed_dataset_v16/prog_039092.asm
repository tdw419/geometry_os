; DESCRIPTION: Composite: Renders a yellow line between points (152, 141) and (165, 219) then Sets a single blue pixel at (299, 194).
; PLAN: r0=152(x1), r1=141(y1), r2=165(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=194(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 141
LDI r2, 165
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 194
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
