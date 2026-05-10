; DESCRIPTION: Composite: Places a cyan line segment connecting (270, 20) to (237, 82) then Creates a red circular shape at (100, 80) with radius 45.
; PLAN: r0=270(x1), r1=20(y1), r2=237(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=80(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 20
LDI r2, 237
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 80
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
