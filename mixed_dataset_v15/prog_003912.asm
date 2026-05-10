; DESCRIPTION: Composite: Places a cyan line segment connecting (90, 207) to (77, 65) then Creates a blue circular shape at (357, 120) with radius 26.
; PLAN: r0=90(x1), r1=207(y1), r2=77(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=120(y), r7=26(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 207
LDI r2, 77
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 120
LDI r7, 26
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
