; DESCRIPTION: Draws a black line from (417, 250) to (444, 71).
; PLAN: r0=417(x1), r1=250(y1), r2=444(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 250
LDI r2, 444
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
