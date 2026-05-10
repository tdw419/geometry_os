; DESCRIPTION: Renders a green line between points (487, 84) and (180, 106).
; PLAN: r0=487(x1), r1=84(y1), r2=180(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 84
LDI r2, 180
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
