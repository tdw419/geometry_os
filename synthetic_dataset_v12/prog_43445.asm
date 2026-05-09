; DESCRIPTION: Places a blue line segment connecting (86, 151) to (90, 209).
; PLAN: r0=86(x1), r1=151(y1), r2=90(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 151
LDI r2, 90
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
