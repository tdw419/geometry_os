; DESCRIPTION: Renders a yellow line between points (53, 168) and (187, 120).
; PLAN: r0=53(x1), r1=168(y1), r2=187(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 168
LDI r2, 187
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
