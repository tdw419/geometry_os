; DESCRIPTION: Places a black line segment connecting (448, 154) to (510, 177).
; PLAN: r0=448(x1), r1=154(y1), r2=510(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 154
LDI r2, 510
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
