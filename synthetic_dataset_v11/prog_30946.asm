; DESCRIPTION: Places a blue line segment connecting (57, 163) to (178, 113).
; PLAN: r0=57(x1), r1=163(y1), r2=178(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 163
LDI r2, 178
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
