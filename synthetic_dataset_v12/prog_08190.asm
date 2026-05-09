; DESCRIPTION: Composite: Places a green line segment connecting (39, 57) to (324, 143) then Renders a orange disk with center (186, 139) and radius 45 then Sets a single red pixel at (188, 28).
; PLAN: r0=39(x1), r1=57(y1), r2=324(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=139(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=28(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 57
LDI r2, 324
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 139
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 28
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
