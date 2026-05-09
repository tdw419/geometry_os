; DESCRIPTION: Draws a purple line from (245, 180) to (333, 130).
; PLAN: r0=245(x1), r1=180(y1), r2=333(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 180
LDI r2, 333
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
