; DESCRIPTION: Places a blue line segment connecting (275, 207) to (57, 5).
; PLAN: r0=275(x1), r1=207(y1), r2=57(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 207
LDI r2, 57
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
