; DESCRIPTION: Composite: Places a magenta line segment connecting (80, 7) to (120, 12) then Creates a red circular shape at (84, 126) with radius 54.
; PLAN: r0=80(x1), r1=7(y1), r2=120(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=126(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 7
LDI r2, 120
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 126
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
