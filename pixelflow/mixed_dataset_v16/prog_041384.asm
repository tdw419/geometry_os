; DESCRIPTION: Draws a red line from (338, 129) to (454, 76).
; PLAN: r0=338(x1), r1=129(y1), r2=454(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 129
LDI r2, 454
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
