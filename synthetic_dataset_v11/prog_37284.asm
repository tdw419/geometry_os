; DESCRIPTION: Places a blue line segment connecting (137, 42) to (142, 113).
; PLAN: r0=137(x1), r1=42(y1), r2=142(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 42
LDI r2, 142
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
