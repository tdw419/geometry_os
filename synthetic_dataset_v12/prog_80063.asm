; DESCRIPTION: Places a blue line segment connecting (191, 246) to (299, 236).
; PLAN: r0=191(x1), r1=246(y1), r2=299(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 246
LDI r2, 299
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
