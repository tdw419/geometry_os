; DESCRIPTION: Draws a white line from (182, 18) to (58, 95).
; PLAN: r0=182(x1), r1=18(y1), r2=58(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 18
LDI r2, 58
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
