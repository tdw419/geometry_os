; DESCRIPTION: Composite: Places a green line segment connecting (262, 65) to (270, 206) then Creates a cyan circular shape at (58, 10) with radius 10 then Sets a single green pixel at (429, 241).
; PLAN: r0=262(x1), r1=65(y1), r2=270(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=10(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x), r11=241(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 65
LDI r2, 270
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 10
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 241
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
