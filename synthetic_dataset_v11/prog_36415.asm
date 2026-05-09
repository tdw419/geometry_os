; DESCRIPTION: Places a magenta line segment connecting (193, 243) to (41, 239).
; PLAN: r0=193(x1), r1=243(y1), r2=41(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 243
LDI r2, 41
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
