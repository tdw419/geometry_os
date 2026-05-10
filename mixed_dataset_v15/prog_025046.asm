; DESCRIPTION: Places a black line segment connecting (209, 69) to (375, 161).
; PLAN: r0=209(x1), r1=69(y1), r2=375(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 69
LDI r2, 375
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
