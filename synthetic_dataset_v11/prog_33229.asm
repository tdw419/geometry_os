; DESCRIPTION: Places a orange line segment connecting (202, 112) to (226, 253).
; PLAN: r0=202(x1), r1=112(y1), r2=226(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 112
LDI r2, 226
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
