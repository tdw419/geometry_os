; DESCRIPTION: Draws a yellow line from (22, 237) to (208, 7).
; PLAN: r0=22(x1), r1=237(y1), r2=208(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 237
LDI r2, 208
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
