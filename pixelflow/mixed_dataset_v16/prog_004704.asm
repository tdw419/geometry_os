; DESCRIPTION: Draws a red line from (221, 206) to (15, 152).
; PLAN: r0=221(x1), r1=206(y1), r2=15(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 206
LDI r2, 15
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
