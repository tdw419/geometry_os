; DESCRIPTION: Places a purple line segment connecting (343, 51) to (242, 240).
; PLAN: r0=343(x1), r1=51(y1), r2=242(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 51
LDI r2, 242
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
