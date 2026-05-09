; DESCRIPTION: Draws a white line from (400, 103) to (325, 6).
; PLAN: r0=400(x1), r1=103(y1), r2=325(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 103
LDI r2, 325
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
