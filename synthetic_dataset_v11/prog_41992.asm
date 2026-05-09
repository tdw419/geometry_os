; DESCRIPTION: Renders a red line between points (212, 110) and (146, 172).
; PLAN: r0=212(x1), r1=110(y1), r2=146(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 110
LDI r2, 146
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
