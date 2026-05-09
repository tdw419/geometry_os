; DESCRIPTION: Places a green line segment connecting (436, 248) to (68, 210).
; PLAN: r0=436(x1), r1=248(y1), r2=68(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 248
LDI r2, 68
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
