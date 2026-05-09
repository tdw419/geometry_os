; DESCRIPTION: Draws a blue line from (272, 77) to (443, 237).
; PLAN: r0=272(x1), r1=77(y1), r2=443(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 77
LDI r2, 443
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
