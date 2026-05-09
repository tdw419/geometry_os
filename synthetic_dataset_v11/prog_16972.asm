; DESCRIPTION: Renders a blue line between points (205, 197) and (102, 168).
; PLAN: r0=205(x1), r1=197(y1), r2=102(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 197
LDI r2, 102
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
