; DESCRIPTION: Renders a black line between points (329, 134) and (492, 205).
; PLAN: r0=329(x1), r1=134(y1), r2=492(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 134
LDI r2, 492
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
