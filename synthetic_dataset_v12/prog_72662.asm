; DESCRIPTION: Renders a blue line between points (392, 99) and (450, 204).
; PLAN: r0=392(x1), r1=99(y1), r2=450(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 99
LDI r2, 450
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
