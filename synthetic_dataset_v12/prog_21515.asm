; DESCRIPTION: Places a white line segment connecting (485, 51) to (396, 14).
; PLAN: r0=485(x1), r1=51(y1), r2=396(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 51
LDI r2, 396
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
