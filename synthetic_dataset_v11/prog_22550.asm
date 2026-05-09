; DESCRIPTION: Places a yellow line segment connecting (171, 241) to (165, 19).
; PLAN: r0=171(x1), r1=241(y1), r2=165(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 241
LDI r2, 165
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
