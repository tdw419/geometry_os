; DESCRIPTION: Renders a green line between points (77, 1) and (112, 208).
; PLAN: r0=77(x1), r1=1(y1), r2=112(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 1
LDI r2, 112
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
