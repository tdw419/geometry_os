; DESCRIPTION: Places a yellow line segment connecting (237, 122) to (32, 246).
; PLAN: r0=237(x1), r1=122(y1), r2=32(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 122
LDI r2, 32
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
