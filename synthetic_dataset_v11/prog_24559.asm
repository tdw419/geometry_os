; DESCRIPTION: Draws a black line from (252, 248) to (96, 80).
; PLAN: r0=252(x1), r1=248(y1), r2=96(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 248
LDI r2, 96
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
