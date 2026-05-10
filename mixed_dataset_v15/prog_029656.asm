; DESCRIPTION: Places a blue line segment connecting (178, 248) to (207, 57).
; PLAN: r0=178(x1), r1=248(y1), r2=207(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 248
LDI r2, 207
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
