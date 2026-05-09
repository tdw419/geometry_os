; DESCRIPTION: Places a purple line segment connecting (120, 179) to (208, 215).
; PLAN: r0=120(x1), r1=179(y1), r2=208(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 179
LDI r2, 208
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
