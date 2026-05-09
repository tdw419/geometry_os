; DESCRIPTION: Composite: Renders a black line between points (135, 161) and (300, 90) then Places a purple circle of radius 31 at center (454, 182).
; PLAN: r0=135(x1), r1=161(y1), r2=300(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=182(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 161
LDI r2, 300
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 182
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
