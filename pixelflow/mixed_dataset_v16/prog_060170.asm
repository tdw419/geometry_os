; DESCRIPTION: Composite: Places a purple circle of radius 31 at center (418, 185) then Places a black dot at position (297, 194) then Renders a white line between points (400, 177) and (446, 139).
; PLAN: r0=418(x), r1=185(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=400(x1), r11=177(y1), r12=446(x2), r13=139(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 185
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 400
LDI r11, 177
LDI r12, 446
LDI r13, 139
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
