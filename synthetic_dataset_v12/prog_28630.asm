; DESCRIPTION: Renders a yellow line between points (379, 63) and (196, 45).
; PLAN: r0=379(x1), r1=63(y1), r2=196(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 63
LDI r2, 196
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
