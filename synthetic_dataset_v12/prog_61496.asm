; DESCRIPTION: Places a blue line segment connecting (172, 28) to (109, 143).
; PLAN: r0=172(x1), r1=28(y1), r2=109(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 28
LDI r2, 109
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
