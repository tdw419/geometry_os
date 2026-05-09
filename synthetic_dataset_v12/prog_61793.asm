; DESCRIPTION: Composite: Places a cyan line segment connecting (363, 188) to (270, 42) then Renders a black disk with center (190, 83) and radius 33.
; PLAN: r0=363(x1), r1=188(y1), r2=270(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=83(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 188
LDI r2, 270
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 83
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
