; DESCRIPTION: Draws a black line from (335, 47) to (440, 115).
; PLAN: r0=335(x1), r1=47(y1), r2=440(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 47
LDI r2, 440
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
