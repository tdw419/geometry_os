; DESCRIPTION: Draws a yellow line from (22, 137) to (71, 214).
; PLAN: r0=22(x1), r1=137(y1), r2=71(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 137
LDI r2, 71
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
