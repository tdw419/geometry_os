; DESCRIPTION: Renders a blue line between points (146, 71) and (75, 67).
; PLAN: r0=146(x1), r1=71(y1), r2=75(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 71
LDI r2, 75
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
