; DESCRIPTION: Composite: Places a white circle of radius 76 at center (255, 109) then Sets a single black pixel at (422, 156) then Places a cyan line segment connecting (243, 240) to (333, 35).
; PLAN: r0=255(x), r1=109(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=156(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=243(x1), r11=240(y1), r12=333(x2), r13=35(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 109
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 156
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 243
LDI r11, 240
LDI r12, 333
LDI r13, 35
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
