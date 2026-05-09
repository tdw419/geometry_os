; DESCRIPTION: Draws a black line from (4, 186) to (185, 150).
; PLAN: r0=4(x1), r1=186(y1), r2=185(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 186
LDI r2, 185
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
