; DESCRIPTION: Draws a blue line from (241, 120) to (44, 96).
; PLAN: r0=241(x1), r1=120(y1), r2=44(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 120
LDI r2, 44
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
