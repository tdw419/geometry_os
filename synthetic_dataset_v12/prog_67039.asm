; DESCRIPTION: Composite: Draws a cyan line from (412, 52) to (175, 17) then Renders a green disk with center (77, 91) and radius 25 then Sets a single purple pixel at (153, 85).
; PLAN: r0=412(x1), r1=52(y1), r2=175(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=91(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=85(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 52
LDI r2, 175
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 91
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 85
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
