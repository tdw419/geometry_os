; DESCRIPTION: Composite: Places a yellow circle of radius 31 at center (450, 43) then Renders a green line between points (31, 81) and (301, 32) then Sets a single purple pixel at (161, 195).
; PLAN: r0=450(x), r1=43(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x1), r6=81(y1), r7=301(x2), r8=32(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=195(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 43
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 81
LDI r7, 301
LDI r8, 32
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 195
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
