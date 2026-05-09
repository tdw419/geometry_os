; DESCRIPTION: Composite: Sets a single magenta pixel at (110, 153) then Places a magenta line segment connecting (350, 211) to (354, 148).
; PLAN: r0=110(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=350(x1), r6=211(y1), r7=354(x2), r8=148(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 211
LDI r7, 354
LDI r8, 148
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
