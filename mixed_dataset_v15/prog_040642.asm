; DESCRIPTION: Renders a white line between points (100, 124) and (77, 210).
; PLAN: r0=100(x1), r1=124(y1), r2=77(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 124
LDI r2, 77
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
