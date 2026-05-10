; DESCRIPTION: Renders a blue line between points (510, 153) and (33, 57).
; PLAN: r0=510(x1), r1=153(y1), r2=33(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 153
LDI r2, 33
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
