; DESCRIPTION: Draws a yellow line from (208, 152) to (131, 105).
; PLAN: r0=208(x1), r1=152(y1), r2=131(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 152
LDI r2, 131
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
