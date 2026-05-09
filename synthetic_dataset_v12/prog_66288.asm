; DESCRIPTION: Composite: Places a black circle of radius 76 at center (87, 124) then Places a purple line segment connecting (194, 210) to (68, 220) then Places a magenta dot at position (3, 86).
; PLAN: r0=87(x), r1=124(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=210(y1), r7=68(x2), r8=220(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=86(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 124
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 210
LDI r7, 68
LDI r8, 220
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 86
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
