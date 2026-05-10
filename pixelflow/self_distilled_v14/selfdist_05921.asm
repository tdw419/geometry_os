; DESCRIPTION: Renders a red line segment connecting (218, 120) to (272, 165).
; PLAN: r0=218(x1), r1=120(y1), r2=272(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 120
LDI r2, 272
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
