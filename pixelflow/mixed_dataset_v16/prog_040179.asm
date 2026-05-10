; DESCRIPTION: Places a blue line segment connecting (418, 135) to (213, 28).
; PLAN: r0=418(x1), r1=135(y1), r2=213(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 135
LDI r2, 213
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
