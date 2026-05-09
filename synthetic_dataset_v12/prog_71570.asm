; DESCRIPTION: Composite: Draws a blue line from (181, 3) to (460, 131) then Sets a single blue pixel at (333, 22).
; PLAN: r0=181(x1), r1=3(y1), r2=460(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 3
LDI r2, 460
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
