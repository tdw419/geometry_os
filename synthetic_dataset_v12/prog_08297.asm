; DESCRIPTION: Renders a red line between points (54, 24) and (502, 58).
; PLAN: r0=54(x1), r1=24(y1), r2=502(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 24
LDI r2, 502
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
