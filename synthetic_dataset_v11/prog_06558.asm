; DESCRIPTION: Renders a white line between points (23, 121) and (92, 233).
; PLAN: r0=23(x1), r1=121(y1), r2=92(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 121
LDI r2, 92
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
