; DESCRIPTION: Draws a blue line from (74, 241) to (156, 29).
; PLAN: r0=74(x1), r1=241(y1), r2=156(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 241
LDI r2, 156
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
