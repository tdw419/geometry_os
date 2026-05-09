; DESCRIPTION: Renders a blue line between points (171, 86) and (44, 63).
; PLAN: r0=171(x1), r1=86(y1), r2=44(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 86
LDI r2, 44
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
