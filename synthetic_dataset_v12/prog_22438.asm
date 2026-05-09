; DESCRIPTION: Places a purple line segment connecting (189, 177) to (362, 180).
; PLAN: r0=189(x1), r1=177(y1), r2=362(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 177
LDI r2, 362
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
