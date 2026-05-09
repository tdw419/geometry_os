; DESCRIPTION: Places a black line segment connecting (117, 246) to (74, 226).
; PLAN: r0=117(x1), r1=246(y1), r2=74(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 246
LDI r2, 74
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
