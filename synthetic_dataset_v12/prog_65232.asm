; DESCRIPTION: Draws a blue line from (435, 184) to (140, 187).
; PLAN: r0=435(x1), r1=184(y1), r2=140(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 184
LDI r2, 140
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
