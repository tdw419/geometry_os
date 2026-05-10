; DESCRIPTION: Composite: Places a black dot at position (133, 181) then Places a white line segment connecting (179, 183) to (282, 85).
; PLAN: r0=133(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=179(x1), r6=183(y1), r7=282(x2), r8=85(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 179
LDI r6, 183
LDI r7, 282
LDI r8, 85
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
