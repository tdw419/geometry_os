; DESCRIPTION: Renders a green line between points (44, 244) and (16, 81).
; PLAN: r0=44(x1), r1=244(y1), r2=16(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 244
LDI r2, 16
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
