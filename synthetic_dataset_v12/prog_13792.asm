; DESCRIPTION: Composite: Renders a black disk with center (80, 177) and radius 73 then Places a yellow line segment connecting (64, 90) to (268, 205).
; PLAN: r0=80(x), r1=177(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=90(y1), r7=268(x2), r8=205(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 177
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 90
LDI r7, 268
LDI r8, 205
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
