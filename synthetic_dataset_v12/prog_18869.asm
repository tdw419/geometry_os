; DESCRIPTION: Composite: Places a orange line segment connecting (414, 70) to (176, 249) then Renders a white disk with center (364, 133) and radius 16.
; PLAN: r0=414(x1), r1=70(y1), r2=176(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=133(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 414
LDI r1, 70
LDI r2, 176
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 133
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
