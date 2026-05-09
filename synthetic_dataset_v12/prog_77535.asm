; DESCRIPTION: Composite: Draws a orange circle centered at (449, 221) with radius 30 then Sets a single white pixel at (116, 254) then Places a green line segment connecting (350, 107) to (208, 140).
; PLAN: r0=449(x), r1=221(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=254(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=107(y1), r12=208(x2), r13=140(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 221
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 254
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 350
LDI r11, 107
LDI r12, 208
LDI r13, 140
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
