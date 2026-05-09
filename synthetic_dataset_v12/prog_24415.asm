; DESCRIPTION: Renders a red line between points (179, 61) and (187, 94).
; PLAN: r0=179(x1), r1=61(y1), r2=187(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 61
LDI r2, 187
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
