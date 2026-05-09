; DESCRIPTION: Draws a white line from (247, 101) to (153, 40).
; PLAN: r0=247(x1), r1=101(y1), r2=153(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 101
LDI r2, 153
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
