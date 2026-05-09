; DESCRIPTION: Renders a red line between points (382, 83) and (252, 124).
; PLAN: r0=382(x1), r1=83(y1), r2=252(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 83
LDI r2, 252
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
