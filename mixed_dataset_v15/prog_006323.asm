; DESCRIPTION: Composite: Places a purple line segment connecting (183, 57) to (401, 96) then Sets a single magenta pixel at (250, 152).
; PLAN: r0=183(x1), r1=57(y1), r2=401(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=152(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 57
LDI r2, 401
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 152
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
