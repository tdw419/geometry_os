; DESCRIPTION: Renders a red line segment connecting (397, 176) to (37, 25).
; PLAN: r0=397(x1), r1=176(y1), r2=37(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 176
LDI r2, 37
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
