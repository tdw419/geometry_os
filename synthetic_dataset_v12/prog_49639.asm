; DESCRIPTION: Composite: Creates a red circular shape at (45, 123) with radius 26 then Renders a magenta line between points (269, 100) and (115, 109).
; PLAN: r0=45(x), r1=123(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x1), r6=100(y1), r7=115(x2), r8=109(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 123
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 100
LDI r7, 115
LDI r8, 109
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
