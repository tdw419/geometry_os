; DESCRIPTION: Draws a blue line from (345, 240) to (83, 64).
; PLAN: r0=345(x1), r1=240(y1), r2=83(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 240
LDI r2, 83
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
