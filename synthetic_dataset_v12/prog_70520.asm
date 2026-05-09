; DESCRIPTION: Composite: Places a cyan line segment connecting (377, 24) to (473, 46) then Sets a single orange pixel at (229, 255) then Creates a red circular shape at (190, 92) with radius 38.
; PLAN: r0=377(x1), r1=24(y1), r2=473(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=92(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 24
LDI r2, 473
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 190
LDI r11, 92
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
