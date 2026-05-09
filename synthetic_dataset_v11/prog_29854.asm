; DESCRIPTION: Draws a white line from (52, 216) to (104, 240).
; PLAN: r0=52(x1), r1=216(y1), r2=104(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 216
LDI r2, 104
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
