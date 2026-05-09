; DESCRIPTION: Draws a black line from (157, 191) to (186, 220).
; PLAN: r0=157(x1), r1=191(y1), r2=186(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 191
LDI r2, 186
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
