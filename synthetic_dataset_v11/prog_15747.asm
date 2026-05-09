; DESCRIPTION: Renders a red line between points (62, 247) and (182, 117).
; PLAN: r0=62(x1), r1=247(y1), r2=182(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 247
LDI r2, 182
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
