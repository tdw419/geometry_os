; DESCRIPTION: Places a yellow line segment connecting (384, 32) to (280, 108).
; PLAN: r0=384(x1), r1=32(y1), r2=280(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 32
LDI r2, 280
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
