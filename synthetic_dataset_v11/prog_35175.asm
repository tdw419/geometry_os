; DESCRIPTION: Renders a white line between points (245, 79) and (136, 240).
; PLAN: r0=245(x1), r1=79(y1), r2=136(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 79
LDI r2, 136
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
