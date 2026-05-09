; DESCRIPTION: Renders a white line between points (22, 171) and (245, 208).
; PLAN: r0=22(x1), r1=171(y1), r2=245(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 171
LDI r2, 245
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
