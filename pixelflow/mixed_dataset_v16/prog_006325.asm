; DESCRIPTION: Draws a blue line from (305, 212) to (343, 87).
; PLAN: r0=305(x1), r1=212(y1), r2=343(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 212
LDI r2, 343
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
