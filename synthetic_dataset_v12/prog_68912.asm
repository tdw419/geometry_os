; DESCRIPTION: Renders a yellow line between points (464, 82) and (232, 18).
; PLAN: r0=464(x1), r1=82(y1), r2=232(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 82
LDI r2, 232
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
