; DESCRIPTION: Composite: Renders a blue disk with center (119, 229) and radius 24 then Places a red line segment connecting (198, 13) to (0, 176).
; PLAN: r0=119(x), r1=229(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x1), r6=13(y1), r7=0(x2), r8=176(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 229
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 13
LDI r7, 0
LDI r8, 176
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
