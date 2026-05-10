; DESCRIPTION: Draws a black line from (389, 3) to (118, 210).
; PLAN: r0=389(x1), r1=3(y1), r2=118(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 3
LDI r2, 118
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
