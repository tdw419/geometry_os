; DESCRIPTION: Renders a red line between points (151, 127) and (185, 138).
; PLAN: r0=151(x1), r1=127(y1), r2=185(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 127
LDI r2, 185
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
