; DESCRIPTION: Places a magenta line segment connecting (271, 31) to (475, 18).
; PLAN: r0=271(x1), r1=31(y1), r2=475(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 31
LDI r2, 475
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
