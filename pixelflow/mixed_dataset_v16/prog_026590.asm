; DESCRIPTION: Draws a blue line from (98, 47) to (280, 184).
; PLAN: r0=98(x1), r1=47(y1), r2=280(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 47
LDI r2, 280
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
