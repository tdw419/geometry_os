; DESCRIPTION: Composite: Places a cyan line segment connecting (123, 141) to (357, 16) then Renders a green disk with center (273, 203) and radius 25 then Sets a single orange pixel at (78, 49).
; PLAN: r0=123(x1), r1=141(y1), r2=357(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=203(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x), r11=49(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 141
LDI r2, 357
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 203
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 49
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
