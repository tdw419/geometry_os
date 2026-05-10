; DESCRIPTION: Draws a black line from (75, 10) to (89, 150).
; PLAN: r0=75(x1), r1=10(y1), r2=89(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 10
LDI r2, 89
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
