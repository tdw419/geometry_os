; DESCRIPTION: Renders a blue line between points (405, 97) and (211, 207).
; PLAN: r0=405(x1), r1=97(y1), r2=211(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 97
LDI r2, 211
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
