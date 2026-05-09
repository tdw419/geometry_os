; DESCRIPTION: Composite: Places a red line segment connecting (278, 204) to (419, 194) then Places a cyan circle of radius 25 at center (83, 161) then Places a yellow dot at position (498, 225).
; PLAN: r0=278(x1), r1=204(y1), r2=419(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=161(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=225(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 204
LDI r2, 419
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 161
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 225
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
