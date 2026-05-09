; DESCRIPTION: Draws a black line from (350, 82) to (140, 94).
; PLAN: r0=350(x1), r1=82(y1), r2=140(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 82
LDI r2, 140
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
