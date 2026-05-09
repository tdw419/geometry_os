; DESCRIPTION: Renders a red line between points (193, 94) and (16, 172).
; PLAN: r0=193(x1), r1=94(y1), r2=16(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 94
LDI r2, 16
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
