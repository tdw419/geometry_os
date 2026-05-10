; DESCRIPTION: Draws a purple line from (417, 108) to (25, 18).
; PLAN: r0=417(x1), r1=108(y1), r2=25(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 108
LDI r2, 25
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
