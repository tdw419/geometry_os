; DESCRIPTION: Draws a white line from (436, 166) to (423, 53).
; PLAN: r0=436(x1), r1=166(y1), r2=423(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 166
LDI r2, 423
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
