; DESCRIPTION: Places a black line segment connecting (267, 76) to (301, 83).
; PLAN: r0=267(x1), r1=76(y1), r2=301(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 76
LDI r2, 301
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
