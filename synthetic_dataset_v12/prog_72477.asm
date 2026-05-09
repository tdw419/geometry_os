; DESCRIPTION: Places a blue line segment connecting (365, 153) to (35, 37).
; PLAN: r0=365(x1), r1=153(y1), r2=35(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 153
LDI r2, 35
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
