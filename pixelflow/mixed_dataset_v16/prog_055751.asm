; DESCRIPTION: Composite: Renders a green line between points (8, 222) and (27, 70) then Places a orange circle of radius 31 at center (451, 85).
; PLAN: r0=8(x1), r1=222(y1), r2=27(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=85(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 222
LDI r2, 27
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 85
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
