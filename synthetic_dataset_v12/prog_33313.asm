; DESCRIPTION: Draws a red line from (21, 138) to (123, 230).
; PLAN: r0=21(x1), r1=138(y1), r2=123(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 138
LDI r2, 123
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
