; DESCRIPTION: Draws a black line from (129, 237) to (33, 229).
; PLAN: r0=129(x1), r1=237(y1), r2=33(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 237
LDI r2, 33
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
