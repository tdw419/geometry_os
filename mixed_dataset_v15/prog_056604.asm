; DESCRIPTION: Draws a red line from (80, 33) to (420, 139).
; PLAN: r0=80(x1), r1=33(y1), r2=420(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 33
LDI r2, 420
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
