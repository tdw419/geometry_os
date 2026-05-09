; DESCRIPTION: Renders a yellow line between points (383, 100) and (455, 236).
; PLAN: r0=383(x1), r1=100(y1), r2=455(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 100
LDI r2, 455
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
