; DESCRIPTION: Places a green line segment connecting (243, 67) to (200, 148).
; PLAN: r0=243(x1), r1=67(y1), r2=200(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 67
LDI r2, 200
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
