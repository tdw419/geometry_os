; DESCRIPTION: Draws a red line from (59, 246) to (14, 164).
; PLAN: r0=59(x1), r1=246(y1), r2=14(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 246
LDI r2, 14
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
