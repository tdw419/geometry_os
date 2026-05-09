; DESCRIPTION: Renders a red line between points (32, 61) and (145, 244).
; PLAN: r0=32(x1), r1=61(y1), r2=145(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 61
LDI r2, 145
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
