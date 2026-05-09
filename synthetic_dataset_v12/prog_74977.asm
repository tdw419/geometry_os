; DESCRIPTION: Places a orange line segment connecting (292, 141) to (400, 235).
; PLAN: r0=292(x1), r1=141(y1), r2=400(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 141
LDI r2, 400
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
