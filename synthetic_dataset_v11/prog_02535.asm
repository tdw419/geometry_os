; DESCRIPTION: Renders a red line between points (165, 241) and (70, 64).
; PLAN: r0=165(x1), r1=241(y1), r2=70(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 241
LDI r2, 70
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
