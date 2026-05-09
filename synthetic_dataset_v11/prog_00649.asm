; DESCRIPTION: Renders a green line between points (79, 208) and (232, 39).
; PLAN: r0=79(x1), r1=208(y1), r2=232(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 208
LDI r2, 232
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
