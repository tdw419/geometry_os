; DESCRIPTION: Renders a cyan line between points (44, 189) and (158, 61).
; PLAN: r0=44(x1), r1=189(y1), r2=158(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 189
LDI r2, 158
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
