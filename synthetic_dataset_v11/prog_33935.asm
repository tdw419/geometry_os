; DESCRIPTION: Renders a red line between points (234, 221) and (50, 70).
; PLAN: r0=234(x1), r1=221(y1), r2=50(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 221
LDI r2, 50
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
