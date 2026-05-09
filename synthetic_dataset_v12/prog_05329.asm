; DESCRIPTION: Composite: Sets a single magenta pixel at (259, 43) then Places a white line segment connecting (77, 88) to (440, 145).
; PLAN: r0=259(x), r1=43(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=77(x1), r6=88(y1), r7=440(x2), r8=145(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 43
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 88
LDI r7, 440
LDI r8, 145
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
