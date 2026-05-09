; DESCRIPTION: Places a magenta line segment connecting (486, 128) to (485, 214).
; PLAN: r0=486(x1), r1=128(y1), r2=485(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 128
LDI r2, 485
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
