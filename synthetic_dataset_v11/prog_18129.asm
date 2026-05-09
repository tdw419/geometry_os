; DESCRIPTION: Draws a purple line from (210, 30) to (250, 195).
; PLAN: r0=210(x1), r1=30(y1), r2=250(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 30
LDI r2, 250
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
