; DESCRIPTION: Composite: Renders a cyan line between points (116, 129) and (180, 129) then Places a purple circle of radius 66 at center (176, 158) then Sets a single yellow pixel at (280, 227).
; PLAN: r0=116(x1), r1=129(y1), r2=180(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=158(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=227(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 129
LDI r2, 180
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 158
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 227
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
