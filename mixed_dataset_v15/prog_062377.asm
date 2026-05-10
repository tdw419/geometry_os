; DESCRIPTION: Draws a red line from (153, 26) to (113, 113).
; PLAN: r0=153(x1), r1=26(y1), r2=113(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 26
LDI r2, 113
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
