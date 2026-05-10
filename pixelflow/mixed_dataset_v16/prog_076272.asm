; DESCRIPTION: Renders a black line between points (376, 188) and (103, 204).
; PLAN: r0=376(x1), r1=188(y1), r2=103(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 188
LDI r2, 103
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
