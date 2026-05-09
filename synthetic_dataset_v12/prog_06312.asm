; DESCRIPTION: Draws a red line from (98, 66) to (325, 46).
; PLAN: r0=98(x1), r1=66(y1), r2=325(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 66
LDI r2, 325
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
