; DESCRIPTION: Places a black line segment connecting (485, 43) to (5, 113).
; PLAN: r0=485(x1), r1=43(y1), r2=5(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 43
LDI r2, 5
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
