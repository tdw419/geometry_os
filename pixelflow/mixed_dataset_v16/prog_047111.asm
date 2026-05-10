; DESCRIPTION: Composite: Renders a green line between points (371, 205) and (463, 31) then Renders a blue disk with center (439, 34) and radius 31.
; PLAN: r0=371(x1), r1=205(y1), r2=463(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=34(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 205
LDI r2, 463
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 34
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
