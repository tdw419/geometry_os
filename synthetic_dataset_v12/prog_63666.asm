; DESCRIPTION: Composite: Draws a cyan line from (453, 113) to (252, 31) then Creates a green circular shape at (345, 96) with radius 79 then Sets a single yellow pixel at (182, 110).
; PLAN: r0=453(x1), r1=113(y1), r2=252(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=96(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x), r11=110(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 113
LDI r2, 252
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 96
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 110
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
