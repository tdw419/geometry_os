; DESCRIPTION: Draws a black line from (417, 56) to (37, 13).
; PLAN: r0=417(x1), r1=56(y1), r2=37(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 56
LDI r2, 37
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
