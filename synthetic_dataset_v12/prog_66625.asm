; DESCRIPTION: Places a red line segment connecting (279, 176) to (485, 210).
; PLAN: r0=279(x1), r1=176(y1), r2=485(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 176
LDI r2, 485
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
