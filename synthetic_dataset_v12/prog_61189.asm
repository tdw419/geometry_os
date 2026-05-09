; DESCRIPTION: Renders a white line between points (363, 174) and (204, 172).
; PLAN: r0=363(x1), r1=174(y1), r2=204(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 174
LDI r2, 204
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
