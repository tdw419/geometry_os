; DESCRIPTION: Draws a black line from (328, 183) to (211, 160).
; PLAN: r0=328(x1), r1=183(y1), r2=211(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 183
LDI r2, 211
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
