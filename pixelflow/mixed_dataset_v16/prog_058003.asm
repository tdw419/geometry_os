; DESCRIPTION: Draws a black line from (241, 204) to (507, 191).
; PLAN: r0=241(x1), r1=204(y1), r2=507(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 204
LDI r2, 507
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
