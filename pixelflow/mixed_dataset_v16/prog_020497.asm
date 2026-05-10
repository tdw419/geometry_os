; DESCRIPTION: Composite: Places a white circle of radius 25 at center (186, 209) then Renders a magenta line between points (132, 200) and (383, 10) then Sets a single cyan pixel at (7, 40).
; PLAN: r0=186(x), r1=209(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=200(y1), r7=383(x2), r8=10(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=40(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 209
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 200
LDI r7, 383
LDI r8, 10
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 40
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
