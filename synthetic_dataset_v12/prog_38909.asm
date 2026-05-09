; DESCRIPTION: Renders a green line between points (323, 180) and (470, 108).
; PLAN: r0=323(x1), r1=180(y1), r2=470(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 180
LDI r2, 470
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
