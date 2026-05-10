; DESCRIPTION: Places a red line segment connecting (299, 33) to (25, 138).
; PLAN: r0=299(x1), r1=33(y1), r2=25(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 33
LDI r2, 25
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
