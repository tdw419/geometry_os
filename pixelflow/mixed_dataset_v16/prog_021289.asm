; DESCRIPTION: Places a red line segment connecting (397, 111) to (233, 191).
; PLAN: r0=397(x1), r1=111(y1), r2=233(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 111
LDI r2, 233
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
