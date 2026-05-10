; DESCRIPTION: Draws a red line from (31, 223) to (420, 178).
; PLAN: r0=31(x1), r1=223(y1), r2=420(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 223
LDI r2, 420
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
