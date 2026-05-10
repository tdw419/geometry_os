; DESCRIPTION: Composite: Draws a magenta line from (121, 84) to (318, 43) then Renders a cyan disk with center (62, 133) and radius 26 then Sets a single red pixel at (225, 242).
; PLAN: r0=121(x1), r1=84(y1), r2=318(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=133(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x), r11=242(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 84
LDI r2, 318
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 133
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 242
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
