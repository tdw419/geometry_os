; DESCRIPTION: Places a blue line segment connecting (72, 42) to (302, 199).
; PLAN: r0=72(x1), r1=42(y1), r2=302(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 42
LDI r2, 302
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
