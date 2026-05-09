; DESCRIPTION: Places a orange line segment connecting (475, 1) to (177, 253).
; PLAN: r0=475(x1), r1=1(y1), r2=177(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 1
LDI r2, 177
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
