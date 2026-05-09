; DESCRIPTION: Places a green line segment connecting (268, 230) to (389, 241).
; PLAN: r0=268(x1), r1=230(y1), r2=389(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 230
LDI r2, 389
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
