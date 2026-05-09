; DESCRIPTION: Places a blue line segment connecting (230, 246) to (48, 209).
; PLAN: r0=230(x1), r1=246(y1), r2=48(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 246
LDI r2, 48
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
