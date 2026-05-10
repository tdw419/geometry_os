; DESCRIPTION: Draws a red line from (103, 22) to (310, 29).
; PLAN: r0=103(x1), r1=22(y1), r2=310(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 22
LDI r2, 310
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
