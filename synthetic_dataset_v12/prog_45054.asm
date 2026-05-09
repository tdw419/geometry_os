; DESCRIPTION: Draws a white line from (103, 191) to (88, 33).
; PLAN: r0=103(x1), r1=191(y1), r2=88(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 191
LDI r2, 88
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
