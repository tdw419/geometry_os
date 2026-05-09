; DESCRIPTION: Composite: Places a blue circle of radius 38 at center (393, 166) then Places a cyan line segment connecting (25, 205) to (468, 181) then Sets a single purple pixel at (75, 196).
; PLAN: r0=393(x), r1=166(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=205(y1), r7=468(x2), r8=181(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=196(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 166
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 205
LDI r7, 468
LDI r8, 181
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 196
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
