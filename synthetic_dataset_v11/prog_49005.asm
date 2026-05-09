; DESCRIPTION: Renders a green line between points (34, 171) and (190, 10).
; PLAN: r0=34(x1), r1=171(y1), r2=190(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 171
LDI r2, 190
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
