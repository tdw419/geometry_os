; DESCRIPTION: Renders a green line between points (234, 190) and (97, 120).
; PLAN: r0=234(x1), r1=190(y1), r2=97(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 190
LDI r2, 97
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
