; DESCRIPTION: Renders a yellow line between points (114, 68) and (331, 75).
; PLAN: r0=114(x1), r1=68(y1), r2=331(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 68
LDI r2, 331
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
