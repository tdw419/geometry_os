; DESCRIPTION: Draws a black line from (116, 110) to (70, 237).
; PLAN: r0=116(x1), r1=110(y1), r2=70(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 110
LDI r2, 70
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
