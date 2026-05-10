; DESCRIPTION: Places a orange line segment connecting (243, 164) to (343, 88).
; PLAN: r0=243(x1), r1=164(y1), r2=343(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 164
LDI r2, 343
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
