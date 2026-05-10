; DESCRIPTION: Renders a red line between points (110, 62) and (415, 187).
; PLAN: r0=110(x1), r1=62(y1), r2=415(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 62
LDI r2, 415
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
