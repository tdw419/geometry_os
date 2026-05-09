; DESCRIPTION: Renders a white line between points (474, 68) and (129, 107).
; PLAN: r0=474(x1), r1=68(y1), r2=129(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 68
LDI r2, 129
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
