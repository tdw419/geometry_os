; DESCRIPTION: Renders a green line between points (388, 181) and (241, 127).
; PLAN: r0=388(x1), r1=181(y1), r2=241(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 181
LDI r2, 241
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
