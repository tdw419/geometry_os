; DESCRIPTION: Draws a white line from (315, 87) to (469, 148).
; PLAN: r0=315(x1), r1=87(y1), r2=469(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 87
LDI r2, 469
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
