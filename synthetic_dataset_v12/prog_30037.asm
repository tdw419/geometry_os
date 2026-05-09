; DESCRIPTION: Renders a white line between points (226, 77) and (245, 199).
; PLAN: r0=226(x1), r1=77(y1), r2=245(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 77
LDI r2, 245
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
