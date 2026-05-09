; DESCRIPTION: Places a green line segment connecting (208, 73) to (55, 79).
; PLAN: r0=208(x1), r1=73(y1), r2=55(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 73
LDI r2, 55
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
