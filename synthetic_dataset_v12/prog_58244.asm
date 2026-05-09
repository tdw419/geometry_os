; DESCRIPTION: Draws a white line from (51, 103) to (274, 176).
; PLAN: r0=51(x1), r1=103(y1), r2=274(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 103
LDI r2, 274
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
