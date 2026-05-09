; DESCRIPTION: Draws a black line from (365, 137) to (155, 215).
; PLAN: r0=365(x1), r1=137(y1), r2=155(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 137
LDI r2, 155
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
