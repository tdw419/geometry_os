; DESCRIPTION: Draws a white line from (469, 2) to (83, 56).
; PLAN: r0=469(x1), r1=2(y1), r2=83(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 2
LDI r2, 83
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
