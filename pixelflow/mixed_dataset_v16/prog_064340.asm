; DESCRIPTION: Renders a green line between points (43, 255) and (399, 238).
; PLAN: r0=43(x1), r1=255(y1), r2=399(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 255
LDI r2, 399
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
