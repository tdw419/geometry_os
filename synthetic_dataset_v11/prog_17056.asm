; DESCRIPTION: Draws a white line from (197, 122) to (119, 153).
; PLAN: r0=197(x1), r1=122(y1), r2=119(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 122
LDI r2, 119
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
