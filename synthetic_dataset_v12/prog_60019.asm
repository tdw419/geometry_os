; DESCRIPTION: Renders a yellow line between points (485, 111) and (203, 33).
; PLAN: r0=485(x1), r1=111(y1), r2=203(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 111
LDI r2, 203
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
