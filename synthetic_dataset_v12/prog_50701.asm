; DESCRIPTION: Renders a red line between points (35, 153) and (110, 171).
; PLAN: r0=35(x1), r1=153(y1), r2=110(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 153
LDI r2, 110
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
