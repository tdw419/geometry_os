; DESCRIPTION: Renders a white line between points (241, 84) and (447, 214).
; PLAN: r0=241(x1), r1=84(y1), r2=447(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 84
LDI r2, 447
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
