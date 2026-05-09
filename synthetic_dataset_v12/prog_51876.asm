; DESCRIPTION: Draws a black line from (83, 141) to (295, 54).
; PLAN: r0=83(x1), r1=141(y1), r2=295(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 141
LDI r2, 295
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
