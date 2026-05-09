; DESCRIPTION: Places a yellow line segment connecting (301, 180) to (267, 34).
; PLAN: r0=301(x1), r1=180(y1), r2=267(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 180
LDI r2, 267
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
