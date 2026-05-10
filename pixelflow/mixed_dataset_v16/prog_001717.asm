; DESCRIPTION: Renders a blue line between points (79, 27) and (193, 22).
; PLAN: r0=79(x1), r1=27(y1), r2=193(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 27
LDI r2, 193
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
