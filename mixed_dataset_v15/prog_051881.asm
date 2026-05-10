; DESCRIPTION: Renders a red line between points (308, 231) and (394, 116).
; PLAN: r0=308(x1), r1=231(y1), r2=394(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 231
LDI r2, 394
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
