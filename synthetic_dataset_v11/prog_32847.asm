; DESCRIPTION: Draws a green line from (216, 179) to (45, 163).
; PLAN: r0=216(x1), r1=179(y1), r2=45(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 179
LDI r2, 45
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
