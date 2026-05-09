; DESCRIPTION: Renders a red line between points (146, 180) and (33, 194).
; PLAN: r0=146(x1), r1=180(y1), r2=33(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 180
LDI r2, 33
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
