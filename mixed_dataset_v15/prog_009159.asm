; DESCRIPTION: Draws a green line from (36, 11) to (449, 216).
; PLAN: r0=36(x1), r1=11(y1), r2=449(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 11
LDI r2, 449
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
