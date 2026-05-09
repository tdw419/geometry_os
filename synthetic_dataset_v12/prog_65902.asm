; DESCRIPTION: Renders a white line between points (80, 124) and (292, 26).
; PLAN: r0=80(x1), r1=124(y1), r2=292(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 124
LDI r2, 292
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
