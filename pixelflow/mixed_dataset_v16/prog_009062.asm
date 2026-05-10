; DESCRIPTION: Renders a red line between points (10, 254) and (464, 55).
; PLAN: r0=10(x1), r1=254(y1), r2=464(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 254
LDI r2, 464
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
