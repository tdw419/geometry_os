; DESCRIPTION: Composite: Sets a single purple pixel at (289, 168) then Places a white line segment connecting (117, 156) to (349, 69).
; PLAN: r0=289(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x1), r6=156(y1), r7=349(x2), r8=69(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 156
LDI r7, 349
LDI r8, 69
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
