; DESCRIPTION: Renders a white line between points (234, 210) and (61, 77).
; PLAN: r0=234(x1), r1=210(y1), r2=61(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 210
LDI r2, 61
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
