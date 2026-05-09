; DESCRIPTION: Renders a red line between points (65, 28) and (184, 38).
; PLAN: r0=65(x1), r1=28(y1), r2=184(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 28
LDI r2, 184
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
