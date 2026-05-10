; DESCRIPTION: Places a red line segment connecting (372, 132) to (171, 69).
; PLAN: r0=372(x1), r1=132(y1), r2=171(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 132
LDI r2, 171
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
