; DESCRIPTION: Renders a green line between points (131, 135) and (179, 133).
; PLAN: r0=131(x1), r1=135(y1), r2=179(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 135
LDI r2, 179
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
