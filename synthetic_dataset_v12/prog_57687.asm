; DESCRIPTION: Draws a red line from (105, 114) to (255, 74).
; PLAN: r0=105(x1), r1=114(y1), r2=255(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 114
LDI r2, 255
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
