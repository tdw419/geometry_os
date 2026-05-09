; DESCRIPTION: Draws a black line from (155, 208) to (401, 3).
; PLAN: r0=155(x1), r1=208(y1), r2=401(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 208
LDI r2, 401
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
