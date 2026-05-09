; DESCRIPTION: Draws a black line from (231, 65) to (417, 39).
; PLAN: r0=231(x1), r1=65(y1), r2=417(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 65
LDI r2, 417
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
