; DESCRIPTION: Draws a red line from (185, 196) to (71, 218).
; PLAN: r0=185(x1), r1=196(y1), r2=71(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 196
LDI r2, 71
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
