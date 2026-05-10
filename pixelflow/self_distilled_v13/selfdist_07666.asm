; DESCRIPTION: Draws a white line from (113, 131) to (153, 11).
; PLAN: r0=113(x1), r1=131(y1), r2=153(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 131
LDI r2, 153
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
