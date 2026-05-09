; DESCRIPTION: Draws a red line from (21, 29) to (123, 81).
; PLAN: r0=21(x1), r1=29(y1), r2=123(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 29
LDI r2, 123
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
