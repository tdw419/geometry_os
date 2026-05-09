; DESCRIPTION: Draws a red line from (207, 53) to (211, 167).
; PLAN: r0=207(x1), r1=53(y1), r2=211(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 53
LDI r2, 211
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
