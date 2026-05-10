; DESCRIPTION: Composite: Places a white line segment connecting (376, 36) to (92, 52) then Places a white circle of radius 11 at center (476, 242) then Sets a single white pixel at (24, 139).
; PLAN: r0=376(x1), r1=36(y1), r2=92(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=242(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=139(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 36
LDI r2, 92
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 242
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 139
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
