; DESCRIPTION: Draws a red line from (184, 225) to (28, 218).
; PLAN: r0=184(x1), r1=225(y1), r2=28(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 225
LDI r2, 28
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
