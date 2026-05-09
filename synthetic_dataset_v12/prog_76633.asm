; DESCRIPTION: Draws a black line from (363, 206) to (86, 22).
; PLAN: r0=363(x1), r1=206(y1), r2=86(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 206
LDI r2, 86
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
