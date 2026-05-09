; DESCRIPTION: Places a green line segment connecting (29, 45) to (170, 19).
; PLAN: r0=29(x1), r1=45(y1), r2=170(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 45
LDI r2, 170
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
