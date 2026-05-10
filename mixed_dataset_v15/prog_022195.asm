; DESCRIPTION: Composite: Renders a yellow line between points (26, 222) and (431, 115) then Places a white circle of radius 28 at center (200, 114).
; PLAN: r0=26(x1), r1=222(y1), r2=431(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=114(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 222
LDI r2, 431
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 114
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
