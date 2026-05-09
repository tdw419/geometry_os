; DESCRIPTION: Places a purple line segment connecting (95, 242) to (19, 213).
; PLAN: r0=95(x1), r1=242(y1), r2=19(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 242
LDI r2, 19
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
