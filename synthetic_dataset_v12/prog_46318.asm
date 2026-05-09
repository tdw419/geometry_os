; DESCRIPTION: Draws a red line from (324, 61) to (329, 177).
; PLAN: r0=324(x1), r1=61(y1), r2=329(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 61
LDI r2, 329
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
