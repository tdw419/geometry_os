; DESCRIPTION: Places a green line segment connecting (304, 56) to (267, 13).
; PLAN: r0=304(x1), r1=56(y1), r2=267(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 56
LDI r2, 267
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
