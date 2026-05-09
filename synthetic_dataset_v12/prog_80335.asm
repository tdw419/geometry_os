; DESCRIPTION: Draws a white line from (70, 23) to (287, 5).
; PLAN: r0=70(x1), r1=23(y1), r2=287(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 23
LDI r2, 287
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
