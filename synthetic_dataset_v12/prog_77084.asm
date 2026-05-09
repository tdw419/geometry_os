; DESCRIPTION: Draws a white line from (442, 40) to (419, 3).
; PLAN: r0=442(x1), r1=40(y1), r2=419(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 40
LDI r2, 419
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
