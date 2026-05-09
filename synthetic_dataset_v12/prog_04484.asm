; DESCRIPTION: Renders a orange line between points (401, 130) and (106, 187).
; PLAN: r0=401(x1), r1=130(y1), r2=106(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 130
LDI r2, 106
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
