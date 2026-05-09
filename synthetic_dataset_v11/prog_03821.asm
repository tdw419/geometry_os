; DESCRIPTION: Places a black line segment connecting (14, 174) to (214, 223).
; PLAN: r0=14(x1), r1=174(y1), r2=214(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 174
LDI r2, 214
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
