; DESCRIPTION: Places a yellow line segment connecting (307, 55) to (174, 106).
; PLAN: r0=307(x1), r1=55(y1), r2=174(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 55
LDI r2, 174
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
