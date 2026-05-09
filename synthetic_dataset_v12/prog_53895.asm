; DESCRIPTION: Places a yellow line segment connecting (157, 69) to (434, 71).
; PLAN: r0=157(x1), r1=69(y1), r2=434(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 69
LDI r2, 434
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
