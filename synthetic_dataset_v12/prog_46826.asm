; DESCRIPTION: Places a yellow line segment connecting (104, 53) to (274, 210).
; PLAN: r0=104(x1), r1=53(y1), r2=274(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 53
LDI r2, 274
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
