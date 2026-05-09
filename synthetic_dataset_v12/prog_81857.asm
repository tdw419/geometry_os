; DESCRIPTION: Renders a red line between points (15, 222) and (503, 132).
; PLAN: r0=15(x1), r1=222(y1), r2=503(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 222
LDI r2, 503
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
