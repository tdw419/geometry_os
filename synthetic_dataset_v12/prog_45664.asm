; DESCRIPTION: Draws a black line from (472, 217) to (510, 55).
; PLAN: r0=472(x1), r1=217(y1), r2=510(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 217
LDI r2, 510
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
