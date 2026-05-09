; DESCRIPTION: Composite: Renders a blue line between points (408, 149) and (283, 219) then Sets a single white pixel at (407, 225).
; PLAN: r0=408(x1), r1=149(y1), r2=283(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=225(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 149
LDI r2, 283
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 225
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
