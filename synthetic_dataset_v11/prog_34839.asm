; DESCRIPTION: Places a red line segment connecting (35, 67) to (121, 132).
; PLAN: r0=35(x1), r1=67(y1), r2=121(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 67
LDI r2, 121
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
