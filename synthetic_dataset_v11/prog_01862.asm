; DESCRIPTION: Places a yellow line segment connecting (38, 195) to (90, 120).
; PLAN: r0=38(x1), r1=195(y1), r2=90(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 195
LDI r2, 90
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
