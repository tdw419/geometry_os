; DESCRIPTION: Draws a yellow line from (458, 79) to (324, 90).
; PLAN: r0=458(x1), r1=79(y1), r2=324(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 79
LDI r2, 324
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
