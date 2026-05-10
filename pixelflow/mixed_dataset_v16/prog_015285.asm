; DESCRIPTION: Composite: Places a orange circle of radius 30 at center (418, 32) then Sets a single green pixel at (493, 185) then Places a green line segment connecting (184, 177) to (177, 141).
; PLAN: r0=418(x), r1=32(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=185(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=184(x1), r11=177(y1), r12=177(x2), r13=141(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 32
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 185
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 184
LDI r11, 177
LDI r12, 177
LDI r13, 141
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
