; DESCRIPTION: Renders a green line between points (214, 147) and (82, 116).
; PLAN: r0=214(x1), r1=147(y1), r2=82(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 147
LDI r2, 82
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
