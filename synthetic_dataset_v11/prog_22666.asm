; DESCRIPTION: Draws a black line from (247, 137) to (115, 243).
; PLAN: r0=247(x1), r1=137(y1), r2=115(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 137
LDI r2, 115
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
