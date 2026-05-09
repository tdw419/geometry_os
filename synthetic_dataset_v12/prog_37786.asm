; DESCRIPTION: Renders a red line between points (398, 221) and (503, 54).
; PLAN: r0=398(x1), r1=221(y1), r2=503(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 221
LDI r2, 503
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
