; DESCRIPTION: Renders a yellow line between points (392, 140) and (367, 108).
; PLAN: r0=392(x1), r1=140(y1), r2=367(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 140
LDI r2, 367
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
