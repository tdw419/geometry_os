; DESCRIPTION: Draws a black line from (501, 186) to (35, 18).
; PLAN: r0=501(x1), r1=186(y1), r2=35(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 186
LDI r2, 35
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
