; DESCRIPTION: Renders a magenta line between points (475, 145) and (403, 231).
; PLAN: r0=475(x1), r1=145(y1), r2=403(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 145
LDI r2, 403
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
