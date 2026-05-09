; DESCRIPTION: Renders a white line between points (245, 24) and (476, 65).
; PLAN: r0=245(x1), r1=24(y1), r2=476(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 24
LDI r2, 476
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
