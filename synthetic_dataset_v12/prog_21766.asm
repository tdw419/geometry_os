; DESCRIPTION: Renders a red line between points (458, 220) and (82, 38).
; PLAN: r0=458(x1), r1=220(y1), r2=82(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 220
LDI r2, 82
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
