; DESCRIPTION: Composite: Places a cyan line segment connecting (12, 185) to (484, 40) then Sets a single green pixel at (190, 115) then Renders a yellow box of size 15x59 starting at (468, 146).
; PLAN: r0=12(x1), r1=185(y1), r2=484(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=115(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=468(x), r11=146(y), r12=15(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 185
LDI r2, 484
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 115
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 468
LDI r11, 146
LDI r12, 15
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
