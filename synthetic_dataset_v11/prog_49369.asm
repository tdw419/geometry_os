; DESCRIPTION: Renders a red line between points (167, 141) and (94, 95).
; PLAN: r0=167(x1), r1=141(y1), r2=94(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 141
LDI r2, 94
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
