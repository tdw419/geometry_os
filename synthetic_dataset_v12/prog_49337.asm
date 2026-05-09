; DESCRIPTION: Renders a blue line between points (130, 228) and (454, 245).
; PLAN: r0=130(x1), r1=228(y1), r2=454(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 228
LDI r2, 454
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
