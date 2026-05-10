; DESCRIPTION: Draws a yellow line from (329, 92) to (55, 95).
; PLAN: r0=329(x1), r1=92(y1), r2=55(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 92
LDI r2, 55
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
