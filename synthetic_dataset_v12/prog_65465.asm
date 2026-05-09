; DESCRIPTION: Renders a red line between points (65, 236) and (21, 181).
; PLAN: r0=65(x1), r1=236(y1), r2=21(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 236
LDI r2, 21
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
