; DESCRIPTION: Composite: Renders a cyan line between points (304, 242) and (157, 203) then Creates a orange circular shape at (102, 135) with radius 58 then Sets a single cyan pixel at (430, 92).
; PLAN: r0=304(x1), r1=242(y1), r2=157(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=135(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=92(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 242
LDI r2, 157
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 135
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 92
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
