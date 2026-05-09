; DESCRIPTION: Draws a black line from (8, 191) to (186, 72).
; PLAN: r0=8(x1), r1=191(y1), r2=186(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 191
LDI r2, 186
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
