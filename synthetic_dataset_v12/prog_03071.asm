; DESCRIPTION: Renders a yellow line between points (60, 53) and (56, 168).
; PLAN: r0=60(x1), r1=53(y1), r2=56(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 53
LDI r2, 56
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
