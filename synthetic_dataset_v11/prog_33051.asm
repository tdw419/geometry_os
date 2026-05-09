; DESCRIPTION: Draws a cyan line from (133, 40) to (184, 201).
; PLAN: r0=133(x1), r1=40(y1), r2=184(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 40
LDI r2, 184
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
