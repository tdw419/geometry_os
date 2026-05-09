; DESCRIPTION: Draws a red line from (494, 103) to (366, 233).
; PLAN: r0=494(x1), r1=103(y1), r2=366(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 103
LDI r2, 366
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
