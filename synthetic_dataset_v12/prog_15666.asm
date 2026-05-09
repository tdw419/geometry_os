; DESCRIPTION: Places a green line segment connecting (482, 245) to (127, 26).
; PLAN: r0=482(x1), r1=245(y1), r2=127(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 245
LDI r2, 127
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
