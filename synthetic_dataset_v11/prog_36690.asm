; DESCRIPTION: Places a green line segment connecting (90, 181) to (114, 19).
; PLAN: r0=90(x1), r1=181(y1), r2=114(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 181
LDI r2, 114
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
