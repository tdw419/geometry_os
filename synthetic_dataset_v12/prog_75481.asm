; DESCRIPTION: Renders a yellow line between points (34, 208) and (117, 83).
; PLAN: r0=34(x1), r1=208(y1), r2=117(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 208
LDI r2, 117
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
