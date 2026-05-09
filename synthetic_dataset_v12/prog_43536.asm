; DESCRIPTION: Draws a white line from (30, 60) to (7, 133).
; PLAN: r0=30(x1), r1=60(y1), r2=7(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 60
LDI r2, 7
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
