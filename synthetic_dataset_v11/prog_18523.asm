; DESCRIPTION: Renders a green line between points (80, 53) and (60, 121).
; PLAN: r0=80(x1), r1=53(y1), r2=60(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 53
LDI r2, 60
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
