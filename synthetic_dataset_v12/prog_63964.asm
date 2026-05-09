; DESCRIPTION: Renders a blue line between points (405, 100) and (146, 250).
; PLAN: r0=405(x1), r1=100(y1), r2=146(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 100
LDI r2, 146
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
