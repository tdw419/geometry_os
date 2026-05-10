; DESCRIPTION: Composite: Places a magenta line segment connecting (448, 112) to (139, 67) then Places a white dot at position (262, 218).
; PLAN: r0=448(x1), r1=112(y1), r2=139(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=218(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 112
LDI r2, 139
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 218
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
