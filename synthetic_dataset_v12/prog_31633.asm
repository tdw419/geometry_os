; DESCRIPTION: Renders a red line between points (263, 77) and (406, 153).
; PLAN: r0=263(x1), r1=77(y1), r2=406(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 77
LDI r2, 406
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
