; DESCRIPTION: Renders a yellow line between points (102, 99) and (151, 131).
; PLAN: r0=102(x1), r1=99(y1), r2=151(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 99
LDI r2, 151
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
