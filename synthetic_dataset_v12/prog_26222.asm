; DESCRIPTION: Renders a white line between points (214, 160) and (149, 227).
; PLAN: r0=214(x1), r1=160(y1), r2=149(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 160
LDI r2, 149
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
