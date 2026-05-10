; DESCRIPTION: Renders a white line between points (58, 72) and (447, 6).
; PLAN: r0=58(x1), r1=72(y1), r2=447(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 72
LDI r2, 447
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
