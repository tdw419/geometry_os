; DESCRIPTION: Renders a green line between points (59, 118) and (13, 76).
; PLAN: r0=59(x1), r1=118(y1), r2=13(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 118
LDI r2, 13
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
