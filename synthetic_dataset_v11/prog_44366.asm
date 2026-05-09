; DESCRIPTION: Places a orange line segment connecting (230, 146) to (140, 178).
; PLAN: r0=230(x1), r1=146(y1), r2=140(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 146
LDI r2, 140
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
