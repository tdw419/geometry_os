; DESCRIPTION: Renders a green line between points (192, 223) and (399, 84).
; PLAN: r0=192(x1), r1=223(y1), r2=399(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 223
LDI r2, 399
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
