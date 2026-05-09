; DESCRIPTION: Renders a green line between points (34, 121) and (21, 23).
; PLAN: r0=34(x1), r1=121(y1), r2=21(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 121
LDI r2, 21
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
