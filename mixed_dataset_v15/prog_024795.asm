; DESCRIPTION: Composite: Renders a orange line between points (379, 149) and (418, 197) then Places a cyan circle of radius 80 at center (147, 124).
; PLAN: r0=379(x1), r1=149(y1), r2=418(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=124(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 149
LDI r2, 418
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 124
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
