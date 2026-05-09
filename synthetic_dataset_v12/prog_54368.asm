; DESCRIPTION: Draws a red line from (429, 180) to (53, 105).
; PLAN: r0=429(x1), r1=180(y1), r2=53(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 180
LDI r2, 53
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
