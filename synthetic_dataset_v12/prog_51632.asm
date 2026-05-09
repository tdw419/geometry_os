; DESCRIPTION: Renders a red line between points (70, 189) and (86, 253).
; PLAN: r0=70(x1), r1=189(y1), r2=86(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 189
LDI r2, 86
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
