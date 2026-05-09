; DESCRIPTION: Renders a blue line between points (61, 46) and (208, 96).
; PLAN: r0=61(x1), r1=46(y1), r2=208(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 46
LDI r2, 208
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
