; DESCRIPTION: Draws a red line from (164, 170) to (59, 135).
; PLAN: r0=164(x1), r1=170(y1), r2=59(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 170
LDI r2, 59
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
