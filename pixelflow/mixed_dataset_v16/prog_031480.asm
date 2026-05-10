; DESCRIPTION: Composite: Places a white dot at position (0, 232) then Places a purple line segment connecting (187, 133) to (487, 118).
; PLAN: r0=0(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=187(x1), r6=133(y1), r7=487(x2), r8=118(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 133
LDI r7, 487
LDI r8, 118
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
