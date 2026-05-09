; DESCRIPTION: Draws a red line from (122, 138) to (236, 221).
; PLAN: r0=122(x1), r1=138(y1), r2=236(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 138
LDI r2, 236
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
