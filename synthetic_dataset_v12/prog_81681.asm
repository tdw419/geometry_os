; DESCRIPTION: Composite: Sets a single white pixel at (205, 78) then Places a blue line segment connecting (379, 211) to (132, 163).
; PLAN: r0=205(x), r1=78(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=379(x1), r6=211(y1), r7=132(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 78
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 211
LDI r7, 132
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
