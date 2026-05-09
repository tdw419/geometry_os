; DESCRIPTION: Places a green line segment connecting (160, 108) to (64, 246).
; PLAN: r0=160(x1), r1=108(y1), r2=64(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 108
LDI r2, 64
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
