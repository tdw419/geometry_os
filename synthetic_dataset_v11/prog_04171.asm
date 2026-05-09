; DESCRIPTION: Renders a white line between points (33, 10) and (241, 252).
; PLAN: r0=33(x1), r1=10(y1), r2=241(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 10
LDI r2, 241
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
