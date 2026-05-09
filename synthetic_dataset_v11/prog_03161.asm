; DESCRIPTION: Places a red line segment connecting (4, 29) to (40, 113).
; PLAN: r0=4(x1), r1=29(y1), r2=40(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 29
LDI r2, 40
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
