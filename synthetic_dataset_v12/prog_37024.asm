; DESCRIPTION: Places a green line segment connecting (267, 153) to (57, 140).
; PLAN: r0=267(x1), r1=153(y1), r2=57(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 153
LDI r2, 57
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
