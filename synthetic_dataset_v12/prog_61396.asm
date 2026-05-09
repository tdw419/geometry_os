; DESCRIPTION: Places a black line segment connecting (424, 177) to (208, 225).
; PLAN: r0=424(x1), r1=177(y1), r2=208(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 177
LDI r2, 208
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
