; DESCRIPTION: Renders a cyan line between points (485, 66) and (357, 167).
; PLAN: r0=485(x1), r1=66(y1), r2=357(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 66
LDI r2, 357
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
