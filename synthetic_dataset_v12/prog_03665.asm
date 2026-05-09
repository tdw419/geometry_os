; DESCRIPTION: Composite: Places a cyan line segment connecting (272, 65) to (234, 82) then Sets a single green pixel at (299, 120) then Places a cyan circle of radius 74 at center (201, 163).
; PLAN: r0=272(x1), r1=65(y1), r2=234(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=120(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=201(x), r11=163(y), r12=74(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 65
LDI r2, 234
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 120
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 201
LDI r11, 163
LDI r12, 74
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
