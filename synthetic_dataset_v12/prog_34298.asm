; DESCRIPTION: Renders a red line between points (245, 163) and (399, 59).
; PLAN: r0=245(x1), r1=163(y1), r2=399(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 163
LDI r2, 399
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
