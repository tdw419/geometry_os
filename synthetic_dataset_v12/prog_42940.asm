; DESCRIPTION: Renders a blue line between points (68, 73) and (370, 21).
; PLAN: r0=68(x1), r1=73(y1), r2=370(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 73
LDI r2, 370
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
