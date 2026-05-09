; DESCRIPTION: Places a red line segment connecting (409, 132) to (240, 214).
; PLAN: r0=409(x1), r1=132(y1), r2=240(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 132
LDI r2, 240
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
