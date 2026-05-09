; DESCRIPTION: Renders a yellow line between points (25, 82) and (221, 218).
; PLAN: r0=25(x1), r1=82(y1), r2=221(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 82
LDI r2, 221
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
