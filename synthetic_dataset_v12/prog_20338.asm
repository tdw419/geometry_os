; DESCRIPTION: Draws a red line from (309, 189) to (250, 65).
; PLAN: r0=309(x1), r1=189(y1), r2=250(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 189
LDI r2, 250
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
