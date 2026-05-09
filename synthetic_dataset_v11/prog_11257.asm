; DESCRIPTION: Draws a red line from (240, 125) to (162, 67).
; PLAN: r0=240(x1), r1=125(y1), r2=162(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 125
LDI r2, 162
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
