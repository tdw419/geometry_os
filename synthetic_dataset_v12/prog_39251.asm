; DESCRIPTION: Draws a black line from (443, 3) to (369, 37).
; PLAN: r0=443(x1), r1=3(y1), r2=369(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 3
LDI r2, 369
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
