; DESCRIPTION: Composite: Places a yellow line segment connecting (279, 238) to (59, 230) then Sets a single orange pixel at (113, 185).
; PLAN: r0=279(x1), r1=238(y1), r2=59(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=185(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 238
LDI r2, 59
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 185
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
