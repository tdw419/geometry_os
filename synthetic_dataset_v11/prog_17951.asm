; DESCRIPTION: Renders a green line between points (225, 151) and (99, 250).
; PLAN: r0=225(x1), r1=151(y1), r2=99(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 151
LDI r2, 99
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
