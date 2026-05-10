; DESCRIPTION: Places a purple line segment connecting (279, 229) to (455, 177).
; PLAN: r0=279(x1), r1=229(y1), r2=455(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 229
LDI r2, 455
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
