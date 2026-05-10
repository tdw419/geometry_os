; DESCRIPTION: Draws a white line from (247, 111) to (100, 133).
; PLAN: r0=247(x1), r1=111(y1), r2=100(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 111
LDI r2, 100
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
