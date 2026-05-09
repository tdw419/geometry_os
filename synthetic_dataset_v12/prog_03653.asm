; DESCRIPTION: Composite: Places a black line segment connecting (84, 100) to (92, 58) then Places a black dot at position (423, 108).
; PLAN: r0=84(x1), r1=100(y1), r2=92(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=108(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 100
LDI r2, 92
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 108
LDI r7, 0x000000
PSET r5, r6, r7
HALT
