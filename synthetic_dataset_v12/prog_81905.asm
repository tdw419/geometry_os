; DESCRIPTION: Composite: Places a yellow line segment connecting (312, 13) to (198, 121) then Places a white circle of radius 71 at center (105, 79).
; PLAN: r0=312(x1), r1=13(y1), r2=198(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=79(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 13
LDI r2, 198
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 79
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
