; DESCRIPTION: Places a magenta line segment connecting (416, 64) to (72, 59).
; PLAN: r0=416(x1), r1=64(y1), r2=72(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 64
LDI r2, 72
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
