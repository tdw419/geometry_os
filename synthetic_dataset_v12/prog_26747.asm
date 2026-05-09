; DESCRIPTION: Draws a purple line from (211, 126) to (365, 138).
; PLAN: r0=211(x1), r1=126(y1), r2=365(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 126
LDI r2, 365
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
