; DESCRIPTION: Draws a black line from (357, 148) to (171, 158).
; PLAN: r0=357(x1), r1=148(y1), r2=171(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 148
LDI r2, 171
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
