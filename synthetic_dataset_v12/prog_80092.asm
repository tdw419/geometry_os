; DESCRIPTION: Places a green line segment connecting (194, 244) to (354, 127).
; PLAN: r0=194(x1), r1=244(y1), r2=354(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 244
LDI r2, 354
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
