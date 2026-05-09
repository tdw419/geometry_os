; DESCRIPTION: Renders a red line between points (39, 44) and (243, 116).
; PLAN: r0=39(x1), r1=44(y1), r2=243(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 44
LDI r2, 243
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
