; DESCRIPTION: Renders a green line between points (468, 100) and (168, 157).
; PLAN: r0=468(x1), r1=100(y1), r2=168(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 100
LDI r2, 168
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
