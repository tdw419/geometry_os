; DESCRIPTION: Renders a blue line between points (59, 60) and (30, 146).
; PLAN: r0=59(x1), r1=60(y1), r2=30(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 60
LDI r2, 30
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
