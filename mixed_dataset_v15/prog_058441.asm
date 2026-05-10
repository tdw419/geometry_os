; DESCRIPTION: Places a purple line segment connecting (146, 149) to (494, 204).
; PLAN: r0=146(x1), r1=149(y1), r2=494(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 149
LDI r2, 494
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
