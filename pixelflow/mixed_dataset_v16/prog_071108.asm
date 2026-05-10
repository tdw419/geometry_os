; DESCRIPTION: Places a red line segment connecting (454, 159) to (124, 27).
; PLAN: r0=454(x1), r1=159(y1), r2=124(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 159
LDI r2, 124
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
