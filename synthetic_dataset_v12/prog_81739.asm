; DESCRIPTION: Renders a purple line between points (357, 62) and (485, 42).
; PLAN: r0=357(x1), r1=62(y1), r2=485(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 62
LDI r2, 485
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
