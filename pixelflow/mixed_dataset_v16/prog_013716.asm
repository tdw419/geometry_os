; DESCRIPTION: Composite: Renders a orange disk with center (335, 167) and radius 72 then Sets a single yellow pixel at (236, 186) then Places a cyan line segment connecting (86, 159) to (155, 249).
; PLAN: r0=335(x), r1=167(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=86(x1), r11=159(y1), r12=155(x2), r13=249(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 167
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 86
LDI r11, 159
LDI r12, 155
LDI r13, 249
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
