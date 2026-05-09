; DESCRIPTION: Renders a magenta line between points (228, 224) and (41, 216).
; PLAN: r0=228(x1), r1=224(y1), r2=41(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 224
LDI r2, 41
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
