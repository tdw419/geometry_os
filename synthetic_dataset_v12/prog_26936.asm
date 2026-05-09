; DESCRIPTION: Renders a red line between points (415, 241) and (336, 14).
; PLAN: r0=415(x1), r1=241(y1), r2=336(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 241
LDI r2, 336
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
