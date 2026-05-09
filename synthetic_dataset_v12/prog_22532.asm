; DESCRIPTION: Places a blue line segment connecting (417, 109) to (116, 213).
; PLAN: r0=417(x1), r1=109(y1), r2=116(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 109
LDI r2, 116
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
