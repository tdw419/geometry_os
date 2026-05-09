; DESCRIPTION: Draws a black line from (84, 166) to (400, 124).
; PLAN: r0=84(x1), r1=166(y1), r2=400(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 166
LDI r2, 400
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
