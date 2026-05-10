; DESCRIPTION: Places a black line segment connecting (179, 37) to (374, 226).
; PLAN: r0=179(x1), r1=37(y1), r2=374(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 37
LDI r2, 374
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
