; DESCRIPTION: Places a red line segment connecting (286, 234) to (287, 255).
; PLAN: r0=286(x1), r1=234(y1), r2=287(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 234
LDI r2, 287
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
