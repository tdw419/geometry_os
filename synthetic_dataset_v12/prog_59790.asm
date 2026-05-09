; DESCRIPTION: Renders a cyan line between points (435, 8) and (93, 97).
; PLAN: r0=435(x1), r1=8(y1), r2=93(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 8
LDI r2, 93
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
