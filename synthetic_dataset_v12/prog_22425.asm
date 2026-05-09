; DESCRIPTION: Composite: Places a green line segment connecting (9, 121) to (134, 116) then Sets a single blue pixel at (92, 32).
; PLAN: r0=9(x1), r1=121(y1), r2=134(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=32(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 121
LDI r2, 134
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 32
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
