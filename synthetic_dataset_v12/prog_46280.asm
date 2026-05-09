; DESCRIPTION: Renders a green line between points (301, 157) and (29, 11).
; PLAN: r0=301(x1), r1=157(y1), r2=29(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 157
LDI r2, 29
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
