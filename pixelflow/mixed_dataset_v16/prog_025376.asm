; DESCRIPTION: Renders a yellow line between points (300, 116) and (154, 141).
; PLAN: r0=300(x1), r1=116(y1), r2=154(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 116
LDI r2, 154
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
