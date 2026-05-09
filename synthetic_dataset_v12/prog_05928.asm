; DESCRIPTION: Renders a white line between points (234, 218) and (123, 95).
; PLAN: r0=234(x1), r1=218(y1), r2=123(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 218
LDI r2, 123
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
