; DESCRIPTION: Composite: Sets a single white pixel at (477, 31) then Renders a white line between points (476, 227) and (193, 57) then Places a cyan circle of radius 72 at center (369, 76).
; PLAN: r0=477(x), r1=31(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=227(y1), r7=193(x2), r8=57(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=76(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 31
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 476
LDI r6, 227
LDI r7, 193
LDI r8, 57
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 76
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
