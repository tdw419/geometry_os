; DESCRIPTION: Places a blue line segment connecting (187, 157) to (206, 112).
; PLAN: r0=187(x1), r1=157(y1), r2=206(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 157
LDI r2, 206
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
