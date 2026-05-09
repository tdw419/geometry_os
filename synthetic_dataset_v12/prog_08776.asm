; DESCRIPTION: Renders a red line between points (397, 127) and (484, 37).
; PLAN: r0=397(x1), r1=127(y1), r2=484(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 127
LDI r2, 484
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
