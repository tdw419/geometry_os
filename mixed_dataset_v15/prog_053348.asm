; DESCRIPTION: Draws a red line from (453, 115) to (243, 82).
; PLAN: r0=453(x1), r1=115(y1), r2=243(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 115
LDI r2, 243
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
