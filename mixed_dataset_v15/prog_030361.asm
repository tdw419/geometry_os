; DESCRIPTION: Draws a green line from (12, 250) to (110, 157).
; PLAN: r0=12(x1), r1=250(y1), r2=110(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 250
LDI r2, 110
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
