; DESCRIPTION: Draws a white line from (161, 185) to (214, 218).
; PLAN: r0=161(x1), r1=185(y1), r2=214(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 185
LDI r2, 214
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
