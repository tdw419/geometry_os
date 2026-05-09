; DESCRIPTION: Places a orange line segment connecting (234, 97) to (178, 210).
; PLAN: r0=234(x1), r1=97(y1), r2=178(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 97
LDI r2, 178
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
