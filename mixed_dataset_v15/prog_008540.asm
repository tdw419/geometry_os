; DESCRIPTION: Renders a green line between points (462, 133) and (354, 106).
; PLAN: r0=462(x1), r1=133(y1), r2=354(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 133
LDI r2, 354
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
