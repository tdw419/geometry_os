; DESCRIPTION: Renders a blue line between points (116, 150) and (98, 162).
; PLAN: r0=116(x1), r1=150(y1), r2=98(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 150
LDI r2, 98
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
