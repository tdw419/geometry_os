; DESCRIPTION: Draws a red line from (116, 59) to (38, 225).
; PLAN: r0=116(x1), r1=59(y1), r2=38(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 59
LDI r2, 38
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
