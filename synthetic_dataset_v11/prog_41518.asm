; DESCRIPTION: Renders a green line between points (180, 170) and (180, 229).
; PLAN: r0=180(x1), r1=170(y1), r2=180(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 170
LDI r2, 180
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
