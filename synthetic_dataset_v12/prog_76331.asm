; DESCRIPTION: Renders a green line between points (451, 160) and (187, 31).
; PLAN: r0=451(x1), r1=160(y1), r2=187(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 160
LDI r2, 187
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
