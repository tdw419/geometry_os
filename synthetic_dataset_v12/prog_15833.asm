; DESCRIPTION: Draws a black line from (388, 186) to (264, 212).
; PLAN: r0=388(x1), r1=186(y1), r2=264(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 186
LDI r2, 264
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
