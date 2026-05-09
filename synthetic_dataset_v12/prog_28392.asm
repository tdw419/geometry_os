; DESCRIPTION: Draws a cyan line from (201, 252) to (300, 250).
; PLAN: r0=201(x1), r1=252(y1), r2=300(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 252
LDI r2, 300
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
