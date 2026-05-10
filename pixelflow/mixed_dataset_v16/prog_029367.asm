; DESCRIPTION: Composite: Places a magenta line segment connecting (281, 126) to (484, 17) then Renders a black disk with center (154, 105) and radius 50.
; PLAN: r0=281(x1), r1=126(y1), r2=484(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=105(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 126
LDI r2, 484
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 105
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
