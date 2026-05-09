; DESCRIPTION: Places a white line segment connecting (153, 32) to (485, 136).
; PLAN: r0=153(x1), r1=32(y1), r2=485(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 32
LDI r2, 485
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
