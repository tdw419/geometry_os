; DESCRIPTION: Renders a white line between points (200, 208) and (234, 6).
; PLAN: r0=200(x1), r1=208(y1), r2=234(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 208
LDI r2, 234
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
