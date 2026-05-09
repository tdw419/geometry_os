; DESCRIPTION: Renders a white line between points (245, 160) and (152, 54).
; PLAN: r0=245(x1), r1=160(y1), r2=152(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 160
LDI r2, 152
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
