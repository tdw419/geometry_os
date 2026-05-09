; DESCRIPTION: Renders a green line between points (208, 83) and (85, 47).
; PLAN: r0=208(x1), r1=83(y1), r2=85(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 83
LDI r2, 85
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
