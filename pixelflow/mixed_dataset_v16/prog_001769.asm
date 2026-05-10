; DESCRIPTION: Draws a black line from (316, 101) to (401, 220).
; PLAN: r0=316(x1), r1=101(y1), r2=401(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 101
LDI r2, 401
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
