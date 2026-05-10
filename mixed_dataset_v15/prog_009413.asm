; DESCRIPTION: Renders a red line between points (387, 233) and (184, 124).
; PLAN: r0=387(x1), r1=233(y1), r2=184(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 233
LDI r2, 184
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
