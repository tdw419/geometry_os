; DESCRIPTION: Draws a red line from (234, 53) to (440, 73).
; PLAN: r0=234(x1), r1=53(y1), r2=440(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 53
LDI r2, 440
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
