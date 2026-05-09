; DESCRIPTION: Places a orange line segment connecting (95, 197) to (366, 210).
; PLAN: r0=95(x1), r1=197(y1), r2=366(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 197
LDI r2, 366
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
