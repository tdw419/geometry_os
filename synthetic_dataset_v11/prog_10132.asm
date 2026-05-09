; DESCRIPTION: Places a blue line segment connecting (86, 213) to (177, 241).
; PLAN: r0=86(x1), r1=213(y1), r2=177(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 213
LDI r2, 177
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
