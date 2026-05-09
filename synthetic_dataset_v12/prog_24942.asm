; DESCRIPTION: Places a white line segment connecting (454, 7) to (11, 253).
; PLAN: r0=454(x1), r1=7(y1), r2=11(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 7
LDI r2, 11
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
