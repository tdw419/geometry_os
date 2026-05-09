; DESCRIPTION: Renders a blue line between points (318, 164) and (59, 231).
; PLAN: r0=318(x1), r1=164(y1), r2=59(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 164
LDI r2, 59
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
