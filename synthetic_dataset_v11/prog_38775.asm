; DESCRIPTION: Composite: . Then Places a red line segment connecting (82, 38) to (90, 80). Then Places a black circle of radius 23 at center (54, 79).
; PLAN: r0=82(x1), r1=38(y1), r2=90(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=79(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (82, 38) to (90, 80).
; PLAN: r0=82(x1), r1=38(y1), r2=90(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 38
LDI r2, 90
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 23 at center (54, 79).
; PLAN: r0=54(x), r1=79(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 79
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
