; DESCRIPTION: Renders a blue line between points (349, 63) and (311, 174).
; PLAN: r0=349(x1), r1=63(y1), r2=311(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 63
LDI r2, 311
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
