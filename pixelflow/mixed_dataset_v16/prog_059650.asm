; DESCRIPTION: Composite: Places a white circle of radius 55 at center (442, 177) then Places a purple dot at position (506, 182) then Draws a red line from (365, 38) to (256, 60).
; PLAN: r0=442(x), r1=177(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x), r6=182(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=365(x1), r11=38(y1), r12=256(x2), r13=60(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 177
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 182
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 365
LDI r11, 38
LDI r12, 256
LDI r13, 60
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
