; DESCRIPTION: Renders a yellow line between points (354, 115) and (485, 188).
; PLAN: r0=354(x1), r1=115(y1), r2=485(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 115
LDI r2, 485
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
