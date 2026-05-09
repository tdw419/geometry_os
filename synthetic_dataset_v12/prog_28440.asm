; DESCRIPTION: Composite: Renders a purple line between points (305, 173) and (234, 201) then Sets a single cyan pixel at (114, 69).
; PLAN: r0=305(x1), r1=173(y1), r2=234(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=69(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 173
LDI r2, 234
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 69
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
