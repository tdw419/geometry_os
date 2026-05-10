; DESCRIPTION: Composite: Creates a red circular shape at (290, 183) with radius 71 then Sets a single cyan pixel at (385, 80) then Places a purple line segment connecting (6, 124) to (449, 184).
; PLAN: r0=290(x), r1=183(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=80(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=6(x1), r11=124(y1), r12=449(x2), r13=184(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 183
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 80
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 6
LDI r11, 124
LDI r12, 449
LDI r13, 184
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
