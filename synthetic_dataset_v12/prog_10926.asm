; DESCRIPTION: Draws a black line from (120, 3) to (7, 94).
; PLAN: r0=120(x1), r1=3(y1), r2=7(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 3
LDI r2, 7
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
