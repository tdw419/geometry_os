; DESCRIPTION: Draws a purple line from (463, 241) to (393, 150).
; PLAN: r0=463(x1), r1=241(y1), r2=393(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 241
LDI r2, 393
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
