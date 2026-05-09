; DESCRIPTION: Places a green line segment connecting (51, 53) to (263, 211).
; PLAN: r0=51(x1), r1=53(y1), r2=263(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 53
LDI r2, 263
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
