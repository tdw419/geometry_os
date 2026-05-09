; DESCRIPTION: Renders a cyan line between points (323, 60) and (47, 99).
; PLAN: r0=323(x1), r1=60(y1), r2=47(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 60
LDI r2, 47
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
