; DESCRIPTION: Places a purple line segment connecting (14, 58) to (243, 177).
; PLAN: r0=14(x1), r1=58(y1), r2=243(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 58
LDI r2, 243
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
