; DESCRIPTION: Draws a black line from (466, 186) to (277, 229).
; PLAN: r0=466(x1), r1=186(y1), r2=277(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 186
LDI r2, 277
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
