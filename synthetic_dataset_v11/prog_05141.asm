; DESCRIPTION: Places a blue line segment connecting (59, 28) to (211, 236).
; PLAN: r0=59(x1), r1=28(y1), r2=211(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 28
LDI r2, 211
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
