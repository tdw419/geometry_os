; DESCRIPTION: Renders a red line between points (1, 37) and (451, 128).
; PLAN: r0=1(x1), r1=37(y1), r2=451(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 37
LDI r2, 451
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
