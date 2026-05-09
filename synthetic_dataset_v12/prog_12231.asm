; DESCRIPTION: Places a green line segment connecting (493, 135) to (226, 206).
; PLAN: r0=493(x1), r1=135(y1), r2=226(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 135
LDI r2, 226
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
