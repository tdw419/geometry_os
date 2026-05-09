; DESCRIPTION: Renders a blue line between points (153, 187) and (32, 59).
; PLAN: r0=153(x1), r1=187(y1), r2=32(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 187
LDI r2, 32
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
