; DESCRIPTION: Places a magenta line segment connecting (41, 96) to (4, 174).
; PLAN: r0=41(x1), r1=96(y1), r2=4(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 96
LDI r2, 4
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
