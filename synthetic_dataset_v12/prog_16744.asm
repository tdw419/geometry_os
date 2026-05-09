; DESCRIPTION: Renders a black line between points (363, 63) and (428, 11).
; PLAN: r0=363(x1), r1=63(y1), r2=428(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 63
LDI r2, 428
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
