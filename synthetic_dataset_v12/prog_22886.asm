; DESCRIPTION: Composite: Draws a white line from (32, 8) to (498, 65) then Places a cyan circle of radius 63 at center (139, 110) then Places a purple dot at position (5, 202).
; PLAN: r0=32(x1), r1=8(y1), r2=498(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=110(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=202(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 32
LDI r1, 8
LDI r2, 498
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 110
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 202
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
