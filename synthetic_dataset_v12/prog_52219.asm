; DESCRIPTION: Places a white line segment connecting (368, 18) to (20, 253).
; PLAN: r0=368(x1), r1=18(y1), r2=20(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 18
LDI r2, 20
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
