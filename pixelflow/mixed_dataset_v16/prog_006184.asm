; DESCRIPTION: Composite: Places a cyan circle of radius 24 at center (448, 57) then Places a white dot at position (372, 224) then Places a yellow line segment connecting (387, 24) to (476, 212).
; PLAN: r0=448(x), r1=57(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=224(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=387(x1), r11=24(y1), r12=476(x2), r13=212(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 57
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 224
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 24
LDI r12, 476
LDI r13, 212
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
