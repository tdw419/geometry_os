; DESCRIPTION: Renders a yellow line between points (218, 208) and (139, 82).
; PLAN: r0=218(x1), r1=208(y1), r2=139(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 208
LDI r2, 139
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
