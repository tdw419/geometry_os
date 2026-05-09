; DESCRIPTION: Renders a white line between points (124, 47) and (433, 41).
; PLAN: r0=124(x1), r1=47(y1), r2=433(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 47
LDI r2, 433
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
