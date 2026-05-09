; DESCRIPTION: Renders a magenta line between points (41, 184) and (90, 107).
; PLAN: r0=41(x1), r1=184(y1), r2=90(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 184
LDI r2, 90
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
