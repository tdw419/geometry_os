; DESCRIPTION: Places a purple line segment connecting (248, 79) to (21, 134).
; PLAN: r0=248(x1), r1=79(y1), r2=21(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 79
LDI r2, 21
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
