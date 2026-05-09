; DESCRIPTION: Places a magenta line segment connecting (505, 41) to (16, 244).
; PLAN: r0=505(x1), r1=41(y1), r2=16(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 41
LDI r2, 16
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
