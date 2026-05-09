; DESCRIPTION: Places a green line segment connecting (165, 76) to (271, 249).
; PLAN: r0=165(x1), r1=76(y1), r2=271(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 76
LDI r2, 271
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
