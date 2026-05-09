; DESCRIPTION: Draws a white line from (5, 197) to (58, 22).
; PLAN: r0=5(x1), r1=197(y1), r2=58(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 197
LDI r2, 58
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
