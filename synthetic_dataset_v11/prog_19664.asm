; DESCRIPTION: Draws a yellow line from (250, 208) to (199, 51).
; PLAN: r0=250(x1), r1=208(y1), r2=199(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 208
LDI r2, 199
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
