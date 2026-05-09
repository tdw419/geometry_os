; DESCRIPTION: Places a red line segment connecting (159, 33) to (226, 196).
; PLAN: r0=159(x1), r1=33(y1), r2=226(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 33
LDI r2, 226
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
