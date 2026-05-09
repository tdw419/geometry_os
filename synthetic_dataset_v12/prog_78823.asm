; DESCRIPTION: Places a black line segment connecting (306, 235) to (485, 165).
; PLAN: r0=306(x1), r1=235(y1), r2=485(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 235
LDI r2, 485
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
