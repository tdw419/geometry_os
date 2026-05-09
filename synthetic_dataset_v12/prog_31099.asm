; DESCRIPTION: Renders a yellow line between points (464, 116) and (177, 254).
; PLAN: r0=464(x1), r1=116(y1), r2=177(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 116
LDI r2, 177
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
