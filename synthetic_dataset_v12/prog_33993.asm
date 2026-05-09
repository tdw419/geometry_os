; DESCRIPTION: Renders a red line between points (286, 50) and (181, 243).
; PLAN: r0=286(x1), r1=50(y1), r2=181(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 50
LDI r2, 181
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
