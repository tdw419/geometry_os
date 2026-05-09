; DESCRIPTION: Places a magenta line segment connecting (491, 250) to (507, 146).
; PLAN: r0=491(x1), r1=250(y1), r2=507(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 250
LDI r2, 507
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
