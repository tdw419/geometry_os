; DESCRIPTION: Draws a blue line from (57, 177) to (254, 41).
; PLAN: r0=57(x1), r1=177(y1), r2=254(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 177
LDI r2, 254
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
