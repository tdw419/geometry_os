; DESCRIPTION: Renders a black line between points (373, 21) and (245, 24).
; PLAN: r0=373(x1), r1=21(y1), r2=245(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 21
LDI r2, 245
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
