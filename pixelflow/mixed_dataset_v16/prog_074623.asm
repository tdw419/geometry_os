; DESCRIPTION: Places a magenta line segment connecting (72, 221) to (375, 148).
; PLAN: r0=72(x1), r1=221(y1), r2=375(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 221
LDI r2, 375
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
