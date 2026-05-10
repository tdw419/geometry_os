; DESCRIPTION: Renders a white line between points (131, 167) and (356, 3).
; PLAN: r0=131(x1), r1=167(y1), r2=356(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 167
LDI r2, 356
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
