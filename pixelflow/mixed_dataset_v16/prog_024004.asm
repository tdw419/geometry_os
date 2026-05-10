; DESCRIPTION: Draws a white line from (429, 95) to (437, 246).
; PLAN: r0=429(x1), r1=95(y1), r2=437(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 95
LDI r2, 437
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
