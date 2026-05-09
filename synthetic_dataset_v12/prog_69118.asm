; DESCRIPTION: Places a purple line segment connecting (275, 189) to (146, 81).
; PLAN: r0=275(x1), r1=189(y1), r2=146(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 189
LDI r2, 146
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
