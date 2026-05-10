; DESCRIPTION: Renders a yellow line between points (504, 168) and (183, 189).
; PLAN: r0=504(x1), r1=168(y1), r2=183(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 168
LDI r2, 183
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
