; DESCRIPTION: Renders a red line between points (222, 128) and (342, 250).
; PLAN: r0=222(x1), r1=128(y1), r2=342(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 128
LDI r2, 342
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
