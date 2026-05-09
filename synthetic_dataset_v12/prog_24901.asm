; DESCRIPTION: Draws a red line from (429, 172) to (235, 193).
; PLAN: r0=429(x1), r1=172(y1), r2=235(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 172
LDI r2, 235
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
