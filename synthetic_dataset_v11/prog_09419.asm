; DESCRIPTION: Places a purple line segment connecting (66, 115) to (220, 143).
; PLAN: r0=66(x1), r1=115(y1), r2=220(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 115
LDI r2, 220
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
