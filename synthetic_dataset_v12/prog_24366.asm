; DESCRIPTION: Renders a blue line between points (160, 174) and (335, 231).
; PLAN: r0=160(x1), r1=174(y1), r2=335(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 174
LDI r2, 335
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
