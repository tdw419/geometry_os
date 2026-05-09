; DESCRIPTION: Draws a white line from (400, 110) to (440, 104).
; PLAN: r0=400(x1), r1=110(y1), r2=440(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 110
LDI r2, 440
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
