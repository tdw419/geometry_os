; DESCRIPTION: Renders a yellow line between points (403, 50) and (189, 53).
; PLAN: r0=403(x1), r1=50(y1), r2=189(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 50
LDI r2, 189
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
