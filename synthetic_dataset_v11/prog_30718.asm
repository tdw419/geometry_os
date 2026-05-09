; DESCRIPTION: Renders a blue line between points (24, 236) and (180, 172).
; PLAN: r0=24(x1), r1=236(y1), r2=180(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 236
LDI r2, 180
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
