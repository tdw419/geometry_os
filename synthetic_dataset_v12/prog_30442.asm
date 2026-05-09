; DESCRIPTION: Places a green line segment connecting (300, 151) to (111, 34).
; PLAN: r0=300(x1), r1=151(y1), r2=111(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 151
LDI r2, 111
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
