; DESCRIPTION: Composite: Renders a black line between points (365, 108) and (131, 106) then Sets a single white pixel at (271, 123).
; PLAN: r0=365(x1), r1=108(y1), r2=131(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=123(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 108
LDI r2, 131
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 123
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
