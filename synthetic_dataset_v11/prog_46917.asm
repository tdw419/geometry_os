; DESCRIPTION: Draws a black line from (78, 102) to (229, 172).
; PLAN: r0=78(x1), r1=102(y1), r2=229(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 102
LDI r2, 229
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
