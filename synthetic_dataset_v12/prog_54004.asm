; DESCRIPTION: Renders a yellow line between points (196, 143) and (189, 48).
; PLAN: r0=196(x1), r1=143(y1), r2=189(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 143
LDI r2, 189
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
