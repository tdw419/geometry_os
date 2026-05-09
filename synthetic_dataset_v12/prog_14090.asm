; DESCRIPTION: Composite: Places a red line segment connecting (449, 193) to (34, 9) then Places a blue circle of radius 63 at center (333, 91) then Places a black dot at position (218, 135).
; PLAN: r0=449(x1), r1=193(y1), r2=34(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=91(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=135(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 193
LDI r2, 34
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 91
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 135
LDI r12, 0x000000
PSET r10, r11, r12
HALT
