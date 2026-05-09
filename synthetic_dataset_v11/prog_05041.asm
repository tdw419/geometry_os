; DESCRIPTION: Places a green line segment connecting (209, 30) to (69, 248).
; PLAN: r0=209(x1), r1=30(y1), r2=69(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 30
LDI r2, 69
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
