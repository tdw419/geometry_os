; DESCRIPTION: Renders a blue line between points (11, 116) and (393, 61).
; PLAN: r0=11(x1), r1=116(y1), r2=393(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 116
LDI r2, 393
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
