; DESCRIPTION: Composite: Places a orange circle of radius 66 at center (93, 137) then Places a yellow line segment connecting (215, 62) to (353, 133).
; PLAN: r0=93(x), r1=137(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=62(y1), r7=353(x2), r8=133(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 137
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 62
LDI r7, 353
LDI r8, 133
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
