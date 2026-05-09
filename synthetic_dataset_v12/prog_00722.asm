; DESCRIPTION: Renders a red line between points (503, 17) and (263, 149).
; PLAN: r0=503(x1), r1=17(y1), r2=263(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 17
LDI r2, 263
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
