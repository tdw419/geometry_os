; DESCRIPTION: Composite: Places a white circle of radius 16 at center (343, 137) then Renders a green line between points (431, 26) and (313, 121) then Sets a single magenta pixel at (363, 233).
; PLAN: r0=343(x), r1=137(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=26(y1), r7=313(x2), r8=121(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 137
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 26
LDI r7, 313
LDI r8, 121
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
