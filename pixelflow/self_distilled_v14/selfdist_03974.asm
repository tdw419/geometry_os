; DESCRIPTION: Draws a blue line from (307, 56) to (346, 116).
; PLAN: r0=307(x1), r1=56(y1), r2=346(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 56
LDI r2, 346
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
