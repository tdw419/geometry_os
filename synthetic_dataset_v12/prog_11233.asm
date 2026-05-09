; DESCRIPTION: Renders a yellow line between points (505, 168) and (53, 95).
; PLAN: r0=505(x1), r1=168(y1), r2=53(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 168
LDI r2, 53
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
