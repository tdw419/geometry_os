; DESCRIPTION: Draws a black line from (195, 250) to (153, 208).
; PLAN: r0=195(x1), r1=250(y1), r2=153(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 250
LDI r2, 153
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
