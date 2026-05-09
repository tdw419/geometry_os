; DESCRIPTION: Renders a white line between points (312, 59) and (245, 63).
; PLAN: r0=312(x1), r1=59(y1), r2=245(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 59
LDI r2, 245
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
