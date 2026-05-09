; DESCRIPTION: Draws a white line from (455, 88) to (317, 207).
; PLAN: r0=455(x1), r1=88(y1), r2=317(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 88
LDI r2, 317
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
