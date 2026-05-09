; DESCRIPTION: Renders a yellow line between points (156, 13) and (143, 253).
; PLAN: r0=156(x1), r1=13(y1), r2=143(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 13
LDI r2, 143
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
