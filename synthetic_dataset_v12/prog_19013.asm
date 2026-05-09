; DESCRIPTION: Places a red line segment connecting (359, 69) to (490, 113).
; PLAN: r0=359(x1), r1=69(y1), r2=490(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 69
LDI r2, 490
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
