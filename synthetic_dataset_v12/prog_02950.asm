; DESCRIPTION: Places a green line segment connecting (441, 159) to (304, 165).
; PLAN: r0=441(x1), r1=159(y1), r2=304(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 159
LDI r2, 304
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
