; DESCRIPTION: Draws a red line from (223, 232) to (117, 126).
; PLAN: r0=223(x1), r1=232(y1), r2=117(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 232
LDI r2, 117
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
