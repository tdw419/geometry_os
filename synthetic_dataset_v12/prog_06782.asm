; DESCRIPTION: Renders a green line between points (470, 133) and (426, 16).
; PLAN: r0=470(x1), r1=133(y1), r2=426(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 133
LDI r2, 426
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
