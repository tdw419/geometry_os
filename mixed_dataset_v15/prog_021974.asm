; DESCRIPTION: Places a orange line segment connecting (326, 125) to (461, 180).
; PLAN: r0=326(x1), r1=125(y1), r2=461(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 125
LDI r2, 461
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
