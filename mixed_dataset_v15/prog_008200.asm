; DESCRIPTION: Composite: Sets a single red pixel at (38, 130) then Places a yellow line segment connecting (186, 41) to (115, 57) then Places a blue circle of radius 38 at center (429, 54).
; PLAN: r0=38(x), r1=130(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=41(y1), r7=115(x2), r8=57(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=54(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 130
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 186
LDI r6, 41
LDI r7, 115
LDI r8, 57
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 54
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
