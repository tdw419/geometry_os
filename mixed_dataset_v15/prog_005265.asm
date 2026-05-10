; DESCRIPTION: Renders a green line between points (94, 116) and (501, 40).
; PLAN: r0=94(x1), r1=116(y1), r2=501(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 116
LDI r2, 501
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
