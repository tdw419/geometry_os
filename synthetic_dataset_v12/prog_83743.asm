; DESCRIPTION: Draws a green line from (216, 6) to (510, 251).
; PLAN: r0=216(x1), r1=6(y1), r2=510(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 6
LDI r2, 510
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
