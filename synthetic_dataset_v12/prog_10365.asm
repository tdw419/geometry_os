; DESCRIPTION: Places a orange line segment connecting (74, 140) to (465, 178).
; PLAN: r0=74(x1), r1=140(y1), r2=465(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 140
LDI r2, 465
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
