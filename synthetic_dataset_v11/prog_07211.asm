; DESCRIPTION: Places a blue line segment connecting (57, 32) to (210, 109).
; PLAN: r0=57(x1), r1=32(y1), r2=210(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 32
LDI r2, 210
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
