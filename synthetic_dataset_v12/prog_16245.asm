; DESCRIPTION: Draws a red line from (64, 23) to (461, 165).
; PLAN: r0=64(x1), r1=23(y1), r2=461(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 23
LDI r2, 461
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
