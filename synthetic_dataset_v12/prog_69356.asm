; DESCRIPTION: Renders a red line between points (283, 7) and (96, 39).
; PLAN: r0=283(x1), r1=7(y1), r2=96(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 7
LDI r2, 96
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
