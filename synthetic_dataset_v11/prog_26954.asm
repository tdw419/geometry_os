; DESCRIPTION: Places a blue line segment connecting (252, 190) to (58, 213).
; PLAN: r0=252(x1), r1=190(y1), r2=58(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 190
LDI r2, 58
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
