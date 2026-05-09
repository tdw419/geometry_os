; DESCRIPTION: Renders a white line between points (73, 202) and (95, 2).
; PLAN: r0=73(x1), r1=202(y1), r2=95(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 202
LDI r2, 95
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
