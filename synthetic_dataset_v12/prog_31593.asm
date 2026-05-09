; DESCRIPTION: Places a red line segment connecting (230, 98) to (310, 157).
; PLAN: r0=230(x1), r1=98(y1), r2=310(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 98
LDI r2, 310
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
