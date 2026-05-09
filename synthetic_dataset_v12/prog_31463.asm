; DESCRIPTION: Renders a magenta line between points (166, 87) and (287, 204).
; PLAN: r0=166(x1), r1=87(y1), r2=287(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 87
LDI r2, 287
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
