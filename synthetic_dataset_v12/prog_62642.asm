; DESCRIPTION: Composite: Places a black circle of radius 78 at center (197, 92) then Places a white dot at position (437, 96) then Draws a white line from (131, 85) to (417, 34).
; PLAN: r0=197(x), r1=92(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=131(x1), r11=85(y1), r12=417(x2), r13=34(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 92
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 131
LDI r11, 85
LDI r12, 417
LDI r13, 34
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
