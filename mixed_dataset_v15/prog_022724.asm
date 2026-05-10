; DESCRIPTION: Draws a white line from (72, 90) to (511, 73).
; PLAN: r0=72(x1), r1=90(y1), r2=511(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 90
LDI r2, 511
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
