; DESCRIPTION: Renders a green line between points (485, 134) and (345, 21).
; PLAN: r0=485(x1), r1=134(y1), r2=345(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 134
LDI r2, 345
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
