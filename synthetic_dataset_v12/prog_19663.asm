; DESCRIPTION: Composite: Renders a blue line between points (44, 205) and (269, 108) then Sets a single magenta pixel at (229, 233).
; PLAN: r0=44(x1), r1=205(y1), r2=269(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=233(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 205
LDI r2, 269
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 233
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
