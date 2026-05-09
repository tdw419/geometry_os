; DESCRIPTION: Renders a yellow line between points (154, 189) and (193, 68).
; PLAN: r0=154(x1), r1=189(y1), r2=193(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 189
LDI r2, 193
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
