; DESCRIPTION: Composite: Sets a single cyan pixel at (355, 210) then Places a blue line segment connecting (402, 226) to (344, 144) then Renders a cyan disk with center (221, 90) and radius 54.
; PLAN: r0=355(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=402(x1), r6=226(y1), r7=344(x2), r8=144(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=90(y), r12=54(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 226
LDI r7, 344
LDI r8, 144
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 90
LDI r12, 54
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
