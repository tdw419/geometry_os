; DESCRIPTION: Draws a purple line from (91, 189) to (225, 240).
; PLAN: r0=91(x1), r1=189(y1), r2=225(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 189
LDI r2, 225
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
