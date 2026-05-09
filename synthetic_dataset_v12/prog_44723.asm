; DESCRIPTION: Draws a black line from (45, 5) to (429, 198).
; PLAN: r0=45(x1), r1=5(y1), r2=429(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 5
LDI r2, 429
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
