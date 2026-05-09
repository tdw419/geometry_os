; DESCRIPTION: Draws a purple line from (425, 92) to (208, 91).
; PLAN: r0=425(x1), r1=92(y1), r2=208(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 92
LDI r2, 208
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
