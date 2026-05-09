; DESCRIPTION: Places a orange line segment connecting (255, 180) to (171, 171).
; PLAN: r0=255(x1), r1=180(y1), r2=171(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 180
LDI r2, 171
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
