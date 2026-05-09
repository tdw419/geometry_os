; DESCRIPTION: Renders a yellow line between points (42, 53) and (250, 61).
; PLAN: r0=42(x1), r1=53(y1), r2=250(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 53
LDI r2, 250
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
