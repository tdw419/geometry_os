; DESCRIPTION: Draws a black line from (429, 134) to (191, 241).
; PLAN: r0=429(x1), r1=134(y1), r2=191(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 134
LDI r2, 191
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
