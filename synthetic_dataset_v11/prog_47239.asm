; DESCRIPTION: Renders a yellow line between points (137, 42) and (137, 103).
; PLAN: r0=137(x1), r1=42(y1), r2=137(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 42
LDI r2, 137
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
