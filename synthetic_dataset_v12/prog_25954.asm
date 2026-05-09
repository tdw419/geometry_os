; DESCRIPTION: Renders a yellow line between points (42, 21) and (341, 135).
; PLAN: r0=42(x1), r1=21(y1), r2=341(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 21
LDI r2, 341
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
