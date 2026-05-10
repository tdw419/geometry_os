; DESCRIPTION: Composite: Renders a yellow line between points (332, 45) and (208, 11) then Places a red dot at position (151, 237).
; PLAN: r0=332(x1), r1=45(y1), r2=208(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=237(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 45
LDI r2, 208
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 237
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
