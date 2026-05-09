; DESCRIPTION: Draws a green line from (126, 147) to (279, 179).
; PLAN: r0=126(x1), r1=147(y1), r2=279(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 147
LDI r2, 279
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
