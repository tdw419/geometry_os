; DESCRIPTION: Renders a blue line between points (171, 58) and (29, 146).
; PLAN: r0=171(x1), r1=58(y1), r2=29(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 58
LDI r2, 29
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
