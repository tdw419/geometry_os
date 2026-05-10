; DESCRIPTION: Composite: Places a yellow line segment connecting (143, 13) to (472, 53) then Places a green circle of radius 51 at center (218, 127).
; PLAN: r0=143(x1), r1=13(y1), r2=472(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=127(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 13
LDI r2, 472
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 127
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
