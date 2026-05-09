; DESCRIPTION: Places a orange line segment connecting (401, 171) to (177, 84).
; PLAN: r0=401(x1), r1=171(y1), r2=177(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 171
LDI r2, 177
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
