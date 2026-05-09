; DESCRIPTION: Places a blue line segment connecting (210, 195) to (96, 109).
; PLAN: r0=210(x1), r1=195(y1), r2=96(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 195
LDI r2, 96
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
