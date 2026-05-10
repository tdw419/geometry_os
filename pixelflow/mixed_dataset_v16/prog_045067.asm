; DESCRIPTION: Draws a black line from (467, 106) to (216, 69).
; PLAN: r0=467(x1), r1=106(y1), r2=216(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 106
LDI r2, 216
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
