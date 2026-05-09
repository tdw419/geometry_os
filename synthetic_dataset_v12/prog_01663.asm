; DESCRIPTION: Renders a red line between points (271, 143) and (151, 4).
; PLAN: r0=271(x1), r1=143(y1), r2=151(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 143
LDI r2, 151
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
