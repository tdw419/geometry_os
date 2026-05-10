; DESCRIPTION: Draws a black line from (363, 54) to (233, 161).
; PLAN: r0=363(x1), r1=54(y1), r2=233(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 54
LDI r2, 233
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
