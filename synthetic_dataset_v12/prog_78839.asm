; DESCRIPTION: Composite: Renders a black line between points (102, 94) and (198, 65) then Places a yellow circle of radius 66 at center (200, 141).
; PLAN: r0=102(x1), r1=94(y1), r2=198(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=141(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 94
LDI r2, 198
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 141
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
