; DESCRIPTION: Composite: Places a white line segment connecting (282, 99) to (321, 89) then Places a red circle of radius 49 at center (304, 142) then Places a magenta dot at position (173, 38).
; PLAN: r0=282(x1), r1=99(y1), r2=321(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=142(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=38(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 99
LDI r2, 321
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 142
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 38
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
