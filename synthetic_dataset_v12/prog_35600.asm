; DESCRIPTION: Draws a white line from (400, 208) to (325, 150).
; PLAN: r0=400(x1), r1=208(y1), r2=325(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 208
LDI r2, 325
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
