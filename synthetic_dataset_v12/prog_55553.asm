; DESCRIPTION: Renders a blue line between points (392, 66) and (21, 65).
; PLAN: r0=392(x1), r1=66(y1), r2=21(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 66
LDI r2, 21
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
