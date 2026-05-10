; DESCRIPTION: Composite: Places a yellow line segment connecting (69, 89) to (114, 170) then Renders a purple disk with center (294, 187) and radius 31 then Sets a single cyan pixel at (356, 128).
; PLAN: r0=69(x1), r1=89(y1), r2=114(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=187(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x), r11=128(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 89
LDI r2, 114
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 187
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 128
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
