; DESCRIPTION: Renders a green line between points (28, 109) and (97, 4).
; PLAN: r0=28(x1), r1=109(y1), r2=97(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 109
LDI r2, 97
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
