; DESCRIPTION: Places a purple line segment connecting (362, 79) to (213, 146).
; PLAN: r0=362(x1), r1=79(y1), r2=213(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 79
LDI r2, 213
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
