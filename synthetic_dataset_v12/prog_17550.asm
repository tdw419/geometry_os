; DESCRIPTION: Places a green line segment connecting (56, 67) to (243, 153).
; PLAN: r0=56(x1), r1=67(y1), r2=243(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 67
LDI r2, 243
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
