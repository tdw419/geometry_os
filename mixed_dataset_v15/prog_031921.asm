; DESCRIPTION: Composite: Sets a single black pixel at (193, 245) then Draws a black line from (396, 56) to (92, 136).
; PLAN: r0=193(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=396(x1), r6=56(y1), r7=92(x2), r8=136(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 245
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 396
LDI r6, 56
LDI r7, 92
LDI r8, 136
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
