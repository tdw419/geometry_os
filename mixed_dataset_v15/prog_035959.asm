; DESCRIPTION: Draws a red line from (429, 22) to (285, 171).
; PLAN: r0=429(x1), r1=22(y1), r2=285(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 22
LDI r2, 285
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
