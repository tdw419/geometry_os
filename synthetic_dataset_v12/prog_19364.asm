; DESCRIPTION: Draws a white line from (166, 5) to (490, 53).
; PLAN: r0=166(x1), r1=5(y1), r2=490(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 5
LDI r2, 490
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
