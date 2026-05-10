; DESCRIPTION: Composite: Renders a orange disk with center (284, 149) and radius 78 then Places a green line segment connecting (195, 89) to (86, 218).
; PLAN: r0=284(x), r1=149(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x1), r6=89(y1), r7=86(x2), r8=218(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 149
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 89
LDI r7, 86
LDI r8, 218
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
